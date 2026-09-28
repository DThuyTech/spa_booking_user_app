import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'src/config/app_config.dart';
import 'src/config/di/injection.dart';
import 'src/core/logging/app_logger.dart';
import 'src/core/logging/log_level.dart';
import 'src/core/storage/preferences_storage.dart';
import 'src/presentation/bloc/app/app_bloc_observer.dart';
import 'src/presentation/bloc/auth_session/auth_session_bloc.dart';
import 'main_app.dart';

/// Bootstrap class initializing logging, crash reporting, async zone,
/// storage, and dependency injection before starting [BoardOiApp].
abstract final class AppBootstrap {
  static Future<void> run({AppConfig? config}) async {
    WidgetsFlutterBinding.ensureInitialized();

    // Enable true edge-to-edge mode for status bar and navigation bar
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarContrastEnforced: false,
      ),
    );

    // 1. Environment & Config
    final appConfig = config ?? EnvironmentLoader.load();

    // 2. Logger & BLoC Observer
    final logger = AppLogger(
      minLevel: appConfig.environment.isProduction
          ? LogLevel.info
          : LogLevel.debug,
      isProduction: appConfig.environment.isProduction,
    );
    Bloc.observer = AppBlocObserver(logger);
    logger.info('Initializing ${appConfig.environment.name} environment...');

    // 3. Storage
    final preferencesStorage = await SharedPreferencesImpl.init();

    // 4. Dependency Injection
    await registerDependencies(
      sl: sl,
      appConfig: appConfig,
      preferencesStorage: preferencesStorage,
      logger: logger,
    );

    // 5. Session Restoration
    final authSessionBloc = sl<AuthSessionBloc>();
    await authSessionBloc.restoreSession();

    // 6. Run Application
    runApp(const BoardOiApp());
  }
}
