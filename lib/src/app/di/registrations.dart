import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../core/config/app_config.dart';
import '../../core/logging/app_logger.dart';
import '../../core/logging/log_level.dart';
import '../../core/network/auth/token_refresh_coordinator.dart';
import '../../core/network/auth/token_storage.dart';
import '../../core/network/dio_client.dart';
import '../../core/network/idempotency/idempotency_key_store.dart';
import '../../core/network/interceptors/auth_interceptor.dart';
import '../../core/network/interceptors/idempotency_interceptor.dart';
import '../../core/network/interceptors/logging_interceptor.dart';
import '../../core/network/interceptors/retry_interceptor.dart';
import '../../core/network/network_client.dart';
import '../../core/realtime/socket_client.dart';
import '../../core/realtime/socket_manager.dart';
import '../../core/storage/preferences_storage.dart';
import '../../core/storage/secure_storage.dart';
import '../../core/storage/session_storage.dart';
import '../../data/datasources/remote/auth/auth_api_service.dart';
import '../../data/datasources/remote/auth/auth_mock_data.dart';
import '../../data/datasources/remote/auth/auth_remote_data_source.dart';
import '../../data/datasources/remote/home/home_remote_data_source.dart';
import '../../data/repositories/auth/auth_repository_impl.dart';
import '../../data/repositories/home/home_repository_impl.dart';
import '../../domain/repositories/auth/auth_repository.dart';
import '../../domain/repositories/home/home_repository.dart';
import '../../domain/usecases/auth/get_current_user.dart';
import '../../domain/usecases/auth/logout_usecase.dart';
import '../../domain/usecases/auth/refresh_token_usecase.dart';
import '../../domain/usecases/auth/request_otp_usecase.dart';
import '../../domain/usecases/auth/restore_session.dart';
import '../../domain/usecases/auth/verify_otp_usecase.dart';
import '../../domain/usecases/home/get_greeting_usecase.dart';
import '../../domain/usecases/auth/login_usecase.dart';
import '../../domain/usecases/auth/register_usecase.dart';
import '../../domain/usecases/auth/save_customer_profile_usecase.dart';
import '../../presentation/bloc/home/home_bloc.dart';
import '../../presentation/bloc/auth/login/login_bloc.dart';
import '../../presentation/bloc/auth/register/register_bloc.dart';
import '../../presentation/bloc/auth/otp_verification/otp_verification_bloc.dart';
import '../../presentation/bloc/profile/profile_bloc.dart';
import '../../presentation/bloc/profile_edit/profile_edit_bloc.dart';
import '../../presentation/bloc/auth_session/auth_session_bloc.dart';
import '../router/app_router.dart';
import '../session/session_manager.dart';

Future<void> registerDependencies({
  required GetIt sl,
  required AppConfig appConfig,
  required PreferencesStorage preferencesStorage,
  SecureStorage? secureStorage,
  Logger? logger,
}) async {
  // 1. Config & Logging
  sl.registerSingleton<AppConfig>(appConfig);

  final log =
      logger ??
      AppLogger(
        minLevel: appConfig.environment.isProduction
            ? LogLevel.info
            : LogLevel.debug,
        isProduction: appConfig.environment.isProduction,
      );
  sl.registerSingleton<Logger>(log);

  // 2. Storage
  final secure = secureStorage ?? FlutterSecureStorageImpl();
  sl.registerSingleton<SecureStorage>(secure);
  sl.registerSingleton<PreferencesStorage>(preferencesStorage);

  final sessionStorage = SessionStorageImpl(
    secureStorage: secure,
    preferencesStorage: preferencesStorage,
  );
  sl.registerSingleton<SessionStorage>(sessionStorage);

  // 3. Session Manager
  final sessionManager = SessionManagerImpl(
    secureTokenStorage: sessionStorage,
    preferencesStorage: preferencesStorage,
    logger: log,
  );
  sl.registerSingleton<SessionManager>(sessionManager);
  sl.registerSingleton<TokenStorage>(sessionManager);

  // 4. Token Refresh Coordinator
  final tokenRefreshCoordinator = TokenRefreshCoordinator(
    tokenStorage: sessionManager,
    refreshDelegate: (refreshToken) async {
      if (sl.isRegistered<RefreshTokenUseCase>()) {
        final result = await sl<RefreshTokenUseCase>()(refreshToken);
        return result.fold((_) => null, (tokens) => tokens);
      }
      return null;
    },
    onSessionExpired: () => sessionManager.markSessionExpired(),
  );
  sl.registerSingleton<TokenRefreshCoordinator>(tokenRefreshCoordinator);

  // 5. Network (Central Dio)
  final dio = Dio();
  final idempotencyKeyStore = const UuidIdempotencyKeyStore();
  sl.registerSingleton<IdempotencyKeyStore>(idempotencyKeyStore);

  dio.interceptors.addAll([
    const IdempotencyInterceptor(),
    AuthInterceptor(
      tokenStorage: sessionManager,
      refreshCoordinator: tokenRefreshCoordinator,
      dio: dio,
    ),
    RetryInterceptor(dio: dio),
    LoggingInterceptor(
      logger: log,
      isProduction: appConfig.environment.isProduction,
    ),
  ]);

  sl.registerSingleton<Dio>(dio);

  final dioClient = DioClient(dioClient: dio, appConfig: appConfig);
  sl.registerSingleton<DioClient>(dioClient);
  sl.registerSingleton<NetworkClient>(dioClient);

  // 6. Realtime
  final socketManager = SocketManager(appConfig: appConfig, logger: log);
  sl.registerSingleton<SocketManager>(socketManager);
  sl.registerSingleton<SocketClient>(socketManager);

  // 7. Router
  final appRouter = AppRouter(sessionManager: sessionManager);
  sl.registerSingleton<AppRouter>(appRouter);

  // 8. Feature - Auth (Mocked for standalone offline flow)
  sl.registerLazySingleton<AuthApiService>(
    () => AuthApiServiceImpl(sl<NetworkClient>()),
  );
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => MockAuthRemoteDataSource(),
  );
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remote: sl<AuthRemoteDataSource>(),
      sessionStorage: sl<SessionStorage>(),
    ),
  );

  sl.registerFactory<RequestOtpUseCase>(
    () => RequestOtpUseCase(sl<AuthRepository>()),
  );
  sl.registerFactory<VerifyOtpUseCase>(
    () => VerifyOtpUseCase(sl<AuthRepository>()),
  );
  sl.registerFactory<RefreshTokenUseCase>(
    () => RefreshTokenUseCase(sl<AuthRepository>()),
  );
  sl.registerFactory<LogoutUseCase>(() => LogoutUseCase(sl<AuthRepository>()));
  sl.registerFactory<RestoreSession>(
    () => RestoreSession(sl<AuthRepository>()),
  );
  sl.registerFactory<GetCurrentUser>(
    () => GetCurrentUser(sl<AuthRepository>()),
  );
  sl.registerFactory<SaveCustomerProfileUseCase>(
    () => SaveCustomerProfileUseCase(sl<AuthRepository>()),
  );

  sl.registerFactory<LoginUseCase>(() => LoginUseCase(sl<AuthRepository>()));
  sl.registerFactory<RegisterUseCase>(
    () => RegisterUseCase(sl<AuthRepository>()),
  );

  sl.registerFactory<LoginBloc>(
    () => LoginBloc(
      loginUseCase: sl<LoginUseCase>(),
      sessionManager: sl<SessionManager>(),
      authSessionBloc: sl.isRegistered<AuthSessionBloc>()
          ? sl<AuthSessionBloc>()
          : null,
    ),
  );
  sl.registerFactory<RegisterBloc>(
    () => RegisterBloc(
      registerUseCase: sl<RegisterUseCase>(),
      sessionManager: sl<SessionManager>(),
      authSessionBloc: sl.isRegistered<AuthSessionBloc>()
          ? sl<AuthSessionBloc>()
          : null,
    ),
  );
  sl.registerFactory<OtpVerificationBloc>(
    () => OtpVerificationBloc(
      verifyOtpUseCase: sl<VerifyOtpUseCase>(),
      requestOtpUseCase: sl<RequestOtpUseCase>(),
    ),
  );
  sl.registerFactory<ProfileBloc>(
    () => ProfileBloc(
      getCurrentUserUseCase: sl<GetCurrentUser>(),
      logoutUseCase: sl<LogoutUseCase>(),
      sessionManager: sl<SessionManager>(),
      authSessionBloc: sl.isRegistered<AuthSessionBloc>()
          ? sl<AuthSessionBloc>()
          : null,
    ),
  );
  sl.registerFactory<ProfileEditBloc>(
    () => ProfileEditBloc(
      saveCustomerProfileUseCase: sl<SaveCustomerProfileUseCase>(),
      authSessionBloc: sl.isRegistered<AuthSessionBloc>()
          ? sl<AuthSessionBloc>()
          : null,
    ),
  );
  sl.registerLazySingleton<AuthSessionBloc>(
    () => AuthSessionBloc(
      restoreSessionUseCase: sl<RestoreSession>(),
      refreshTokenUseCase: sl<RefreshTokenUseCase>(),
      logoutUseCase: sl<LogoutUseCase>(),
      sessionStorage: sl<SessionStorage>(),
      sessionManager: sl<SessionManager>(),
    ),
  );

  // 9. Feature - Home (Mocked for standalone offline flow)
  sl.registerFactory<HomeRemoteDataSource>(
    () => const MockHomeRemoteDataSource(),
  );
  sl.registerFactory<HomeRepository>(
    () => HomeRepositoryImpl(sl<HomeRemoteDataSource>()),
  );
  sl.registerFactory<GetGreetingUseCase>(
    () => GetGreetingUseCase(sl<HomeRepository>()),
  );
  sl.registerFactory<HomeBloc>(
    () => HomeBloc(getGreetingUseCase: sl<GetGreetingUseCase>()),
  );
}
