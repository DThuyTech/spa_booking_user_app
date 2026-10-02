import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../core/constants/app_constants.dart';
import '../core/localization/app_localizations.dart';
import '../shared/design_system/theme/app_theme.dart';
import 'di/dependency_injection.dart';
import 'router/app_router.dart';
import 'session/session_manager.dart';

class SpaBookingApp extends StatelessWidget {
  const SpaBookingApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = sl<AppRouter>();
    final sessionManager = sl<SessionManager>();

    return MaterialApp.router(
      title: AppConstants.appName,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      routerConfig: appRouter.config(
        reevaluateListenable: ReevaluateListenable.stream(
          sessionManager.sessionStream,
        ),
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
