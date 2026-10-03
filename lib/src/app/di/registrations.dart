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

import '../../data/datasources/remote/store/store_remote_data_source.dart';
import '../../data/repositories/store/store_repository_impl.dart';
import '../../domain/repositories/store/store_repository.dart';
import '../../domain/usecases/store/get_stores_usecase.dart';
import '../../domain/usecases/store/get_store_detail_usecase.dart';
import '../../domain/usecases/store/get_store_categories_usecase.dart';
import '../../domain/usecases/store/get_store_services_usecase.dart';
import '../../domain/usecases/store/get_store_staff_usecase.dart';
import '../../domain/usecases/store/get_store_gallery_usecase.dart';
import '../../presentation/bloc/store/store_list/store_list_bloc.dart';
import '../../presentation/bloc/store/store_detail/store_detail_bloc.dart';
import '../../presentation/bloc/store/store_services/store_services_bloc.dart';
import '../../presentation/bloc/store/store_staff/store_staff_bloc.dart';
import '../../presentation/bloc/store/store_gallery/store_gallery_bloc.dart';
import '../../domain/usecases/store/get_store_schedule_grid_usecase.dart';
import '../../presentation/bloc/store/store_schedule_grid/store_schedule_grid_bloc.dart';

import '../../data/datasources/remote/booking/booking_remote_data_source.dart';
import '../../data/repositories/booking/booking_repository_impl.dart';
import '../../domain/repositories/booking/booking_repository.dart';
import '../../domain/usecases/booking/get_availability_usecase.dart';
import '../../domain/usecases/booking/create_booking_usecase.dart';
import '../../domain/usecases/booking/get_customer_bookings_usecase.dart';
import '../../domain/usecases/booking/get_booking_detail_usecase.dart';
import '../../domain/usecases/booking/reschedule_booking_usecase.dart';
import '../../domain/usecases/booking/cancel_booking_usecase.dart';
import '../../domain/usecases/booking/update_booking_notes_usecase.dart';
import '../../domain/usecases/booking/get_customer_spending_analytics_usecase.dart';
import '../../presentation/bloc/booking/booking_availability/booking_availability_bloc.dart';
import '../../presentation/bloc/booking/create_booking/create_booking_bloc.dart';
import '../../presentation/bloc/booking/booking_dashboard/booking_dashboard_bloc.dart';
import '../../presentation/bloc/booking/booking_detail/booking_detail_bloc.dart';
import '../../presentation/bloc/booking/booking_action/booking_action_bloc.dart';
import '../../presentation/bloc/insights/spending_analytics_bloc.dart';

import '../../data/datasources/remote/review/review_remote_data_source.dart';
import '../../data/repositories/review/review_repository_impl.dart';
import '../../domain/repositories/review/review_repository.dart';
import '../../domain/usecases/review/get_store_reviews_usecase.dart';
import '../../domain/usecases/review/create_store_review_usecase.dart';
import '../../domain/usecases/review/create_booking_review_usecase.dart';
import '../../presentation/bloc/review/store_reviews/store_reviews_bloc.dart';
import '../../presentation/bloc/review/write_review/write_review_bloc.dart';

import '../../data/datasources/remote/favorite/favorite_remote_data_source.dart';
import '../../data/repositories/favorite/favorite_repository_impl.dart';
import '../../domain/repositories/favorite/favorite_repository.dart';
import '../../domain/usecases/favorite/get_favorites_usecase.dart';
import '../../presentation/bloc/favorite/favorite_stores_bloc.dart';

import '../../data/datasources/remote/voucher/voucher_remote_data_source.dart';
import '../../data/repositories/voucher/voucher_repository_impl.dart';
import '../../domain/repositories/voucher/voucher_repository.dart';
import '../../domain/usecases/voucher/voucher_usecases.dart';
import '../../presentation/bloc/voucher/voucher_bloc.dart';

import '../../data/datasources/remote/notification/notification_remote_data_source.dart';
import '../../data/repositories/notification/notification_repository_impl.dart';
import '../../domain/repositories/notification/notification_repository.dart';
import '../../domain/usecases/notification/notification_usecases.dart';
import '../../presentation/bloc/notification/notification_bloc.dart';

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

  // 8. Feature - Auth (Connected to API)
  sl.registerLazySingleton<AuthApiService>(
    () => AuthApiServiceImpl(sl<NetworkClient>()),
  );
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(sl<AuthApiService>()),
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
      getCustomerBookingsUseCase: sl.isRegistered<GetCustomerBookingsUseCase>()
          ? sl<GetCustomerBookingsUseCase>()
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

  // 9. Feature - Store & Discovery (Clean Architecture API)
  sl.registerLazySingleton<StoreRemoteDataSource>(
    () => StoreRemoteDataSourceImpl(sl<NetworkClient>()),
  );
  sl.registerLazySingleton<StoreRepository>(
    () => StoreRepositoryImpl(sl<StoreRemoteDataSource>()),
  );
  sl.registerFactory<GetStoresUseCase>(
    () => GetStoresUseCase(sl<StoreRepository>()),
  );
  sl.registerFactory<GetStoreDetailUseCase>(
    () => GetStoreDetailUseCase(sl<StoreRepository>()),
  );
  sl.registerFactory<GetStoreCategoriesUseCase>(
    () => GetStoreCategoriesUseCase(sl<StoreRepository>()),
  );
  sl.registerFactory<GetStoreServicesUseCase>(
    () => GetStoreServicesUseCase(sl<StoreRepository>()),
  );
  sl.registerFactory<GetStoreStaffUseCase>(
    () => GetStoreStaffUseCase(sl<StoreRepository>()),
  );
  sl.registerFactory<GetStoreGalleryUseCase>(
    () => GetStoreGalleryUseCase(sl<StoreRepository>()),
  );

  sl.registerFactory<StoreListBloc>(
    () => StoreListBloc(getStoresUseCase: sl<GetStoresUseCase>()),
  );
  sl.registerFactory<StoreDetailBloc>(
    () => StoreDetailBloc(getStoreDetailUseCase: sl<GetStoreDetailUseCase>()),
  );
  sl.registerFactory<StoreServicesBloc>(
    () => StoreServicesBloc(
      getCategoriesUseCase: sl<GetStoreCategoriesUseCase>(),
      getServicesUseCase: sl<GetStoreServicesUseCase>(),
    ),
  );
  sl.registerFactory<StoreStaffBloc>(
    () => StoreStaffBloc(getStoreStaffUseCase: sl<GetStoreStaffUseCase>()),
  );
  sl.registerFactory<StoreGalleryBloc>(
    () => StoreGalleryBloc(getStoreGalleryUseCase: sl<GetStoreGalleryUseCase>()),
  );
  sl.registerFactory<GetStoreScheduleGridUseCase>(
    () => GetStoreScheduleGridUseCase(sl<StoreRepository>()),
  );
  sl.registerFactory<StoreScheduleGridBloc>(
    () => StoreScheduleGridBloc(
      getStoreScheduleGridUseCase: sl<GetStoreScheduleGridUseCase>(),
    ),
  );

  // 10. Feature - Availability & Booking Lifecycle (Clean Architecture API)
  sl.registerLazySingleton<BookingRemoteDataSource>(
    () => BookingRemoteDataSourceImpl(sl<NetworkClient>()),
  );
  sl.registerLazySingleton<BookingRepository>(
    () => BookingRepositoryImpl(sl<BookingRemoteDataSource>()),
  );
  sl.registerFactory<GetAvailabilityUseCase>(
    () => GetAvailabilityUseCase(sl<BookingRepository>()),
  );
  sl.registerFactory<CreateBookingUseCase>(
    () => CreateBookingUseCase(sl<BookingRepository>()),
  );
  sl.registerFactory<GetCustomerBookingsUseCase>(
    () => GetCustomerBookingsUseCase(sl<BookingRepository>()),
  );
  sl.registerFactory<GetBookingDetailUseCase>(
    () => GetBookingDetailUseCase(sl<BookingRepository>()),
  );
  sl.registerFactory<RescheduleBookingUseCase>(
    () => RescheduleBookingUseCase(sl<BookingRepository>()),
  );
  sl.registerFactory<CancelBookingUseCase>(
    () => CancelBookingUseCase(sl<BookingRepository>()),
  );
  sl.registerFactory<UpdateBookingNotesUseCase>(
    () => UpdateBookingNotesUseCase(sl<BookingRepository>()),
  );
  sl.registerFactory<GetCustomerSpendingAnalyticsUseCase>(
    () => GetCustomerSpendingAnalyticsUseCase(sl<BookingRepository>()),
  );

  sl.registerFactory<BookingAvailabilityBloc>(
    () => BookingAvailabilityBloc(
      getAvailabilityUseCase: sl<GetAvailabilityUseCase>(),
    ),
  );
  sl.registerFactory<CreateBookingBloc>(
    () => CreateBookingBloc(
      createBookingUseCase: sl<CreateBookingUseCase>(),
    ),
  );
  sl.registerFactory<BookingDashboardBloc>(
    () => BookingDashboardBloc(
      getCustomerBookingsUseCase: sl<GetCustomerBookingsUseCase>(),
    ),
  );
  sl.registerFactory<BookingDetailBloc>(
    () => BookingDetailBloc(
      getBookingDetailUseCase: sl<GetBookingDetailUseCase>(),
    ),
  );
  sl.registerFactory<BookingActionBloc>(
    () => BookingActionBloc(
      cancelBookingUseCase: sl<CancelBookingUseCase>(),
      rescheduleBookingUseCase: sl<RescheduleBookingUseCase>(),
      updateBookingNotesUseCase: sl<UpdateBookingNotesUseCase>(),
    ),
  );
  sl.registerFactory<SpendingAnalyticsBloc>(
    () => SpendingAnalyticsBloc(
      sl<GetCustomerSpendingAnalyticsUseCase>(),
    ),
  );

  // 11. Feature - Reviews & Ratings
  sl.registerLazySingleton<ReviewRemoteDataSource>(
    () => ReviewRemoteDataSourceImpl(sl<NetworkClient>()),
  );
  sl.registerLazySingleton<ReviewRepository>(
    () => ReviewRepositoryImpl(remoteDataSource: sl<ReviewRemoteDataSource>()),
  );
  sl.registerFactory<GetStoreReviewsUseCase>(
    () => GetStoreReviewsUseCase(sl<ReviewRepository>()),
  );
  sl.registerFactory<CreateStoreReviewUseCase>(
    () => CreateStoreReviewUseCase(sl<ReviewRepository>()),
  );
  sl.registerFactory<CreateBookingReviewUseCase>(
    () => CreateBookingReviewUseCase(sl<ReviewRepository>()),
  );
  sl.registerFactory<StoreReviewsBloc>(
    () => StoreReviewsBloc(getStoreReviewsUseCase: sl<GetStoreReviewsUseCase>()),
  );
  sl.registerFactory<WriteReviewBloc>(
    () => WriteReviewBloc(
      createStoreReviewUseCase: sl<CreateStoreReviewUseCase>(),
      createBookingReviewUseCase: sl<CreateBookingReviewUseCase>(),
    ),
  );

  // 12. Feature - Favorites / Wishlist
  sl.registerLazySingleton<FavoriteRemoteDataSource>(
    () => FavoriteRemoteDataSourceImpl(sl<NetworkClient>()),
  );
  sl.registerLazySingleton<FavoriteRepository>(
    () => FavoriteRepositoryImpl(remoteDataSource: sl<FavoriteRemoteDataSource>()),
  );
  sl.registerFactory<GetFavoritesUseCase>(
    () => GetFavoritesUseCase(sl<FavoriteRepository>()),
  );
  sl.registerFactory<ToggleFavoriteUseCase>(
    () => ToggleFavoriteUseCase(sl<FavoriteRepository>()),
  );
  sl.registerFactory<FavoriteStoresBloc>(
    () => FavoriteStoresBloc(
      getFavoritesUseCase: sl<GetFavoritesUseCase>(),
      toggleFavoriteUseCase: sl<ToggleFavoriteUseCase>(),
    ),
  );

  // 13. Feature - Vouchers & Promotions
  sl.registerLazySingleton<VoucherRemoteDataSource>(
    () => VoucherRemoteDataSourceImpl(sl<NetworkClient>()),
  );
  sl.registerLazySingleton<VoucherRepository>(
    () => VoucherRepositoryImpl(remoteDataSource: sl<VoucherRemoteDataSource>()),
  );
  sl.registerFactory<GetStoreVouchersUseCase>(
    () => GetStoreVouchersUseCase(sl<VoucherRepository>()),
  );
  sl.registerFactory<GetCustomerVouchersUseCase>(
    () => GetCustomerVouchersUseCase(sl<VoucherRepository>()),
  );
  sl.registerFactory<ApplyVoucherUseCase>(
    () => ApplyVoucherUseCase(sl<VoucherRepository>()),
  );
  sl.registerFactory<VoucherBloc>(
    () => VoucherBloc(
      getStoreVouchersUseCase: sl<GetStoreVouchersUseCase>(),
      getCustomerVouchersUseCase: sl<GetCustomerVouchersUseCase>(),
      applyVoucherUseCase: sl<ApplyVoucherUseCase>(),
    ),
  );

  // 14. Feature - Notifications
  sl.registerLazySingleton<NotificationRemoteDataSource>(
    () => NotificationRemoteDataSourceImpl(sl<NetworkClient>()),
  );
  sl.registerLazySingleton<NotificationRepository>(
    () => NotificationRepositoryImpl(remoteDataSource: sl<NotificationRemoteDataSource>()),
  );
  sl.registerFactory<GetNotificationsUseCase>(
    () => GetNotificationsUseCase(sl<NotificationRepository>()),
  );
  sl.registerFactory<GetUnreadNotificationCountUseCase>(
    () => GetUnreadNotificationCountUseCase(sl<NotificationRepository>()),
  );
  sl.registerFactory<MarkNotificationReadUseCase>(
    () => MarkNotificationReadUseCase(sl<NotificationRepository>()),
  );
  sl.registerFactory<MarkAllNotificationsReadUseCase>(
    () => MarkAllNotificationsReadUseCase(sl<NotificationRepository>()),
  );
  sl.registerFactory<NotificationBloc>(
    () => NotificationBloc(
      getNotificationsUseCase: sl<GetNotificationsUseCase>(),
      getUnreadNotificationCountUseCase: sl<GetUnreadNotificationCountUseCase>(),
      markNotificationReadUseCase: sl<MarkNotificationReadUseCase>(),
      markAllNotificationsReadUseCase: sl<MarkAllNotificationsReadUseCase>(),
    ),
  );

  // 15. Feature - Home Greeting
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
    () => HomeBloc(
      getGreetingUseCase: sl<GetGreetingUseCase>(),
      getStoresUseCase: sl<GetStoresUseCase>(),
    ),
  );
}
