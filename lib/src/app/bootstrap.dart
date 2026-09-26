import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_bloc/app_bloc_observer.dart';
import '../core/config/app_config.dart';
import '../core/config/environment_loader.dart';
import '../core/logging/app_logger.dart';
import '../core/logging/log_level.dart';
import '../core/storage/preferences_storage.dart';
import 'app.dart';
import 'di/dependency_injection.dart';
import 'di/registrations.dart';
import 'session/session_manager.dart';

abstract final class AppBootstrap {
  static Future<void> run({AppConfig? config}) async {
    WidgetsFlutterBinding.ensureInitialized();

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
    final sessionManager = sl<SessionManager>();
    await sessionManager.restoreSession();

    // 6. Run Application
    runApp(const BoardOiApp());
  }
}
