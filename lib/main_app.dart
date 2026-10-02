import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'src/config/di/injection.dart';
import 'src/config/router/router.dart';
import 'src/core/constants/app_constants.dart';
import 'src/core/localization/app_localizations.dart';
import 'src/app/session/session_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'src/presentation/bloc/auth_session/auth_session_bloc.dart';
import 'src/shared/design_system/theme/app_theme.dart';

/// Main application widget configuring MaterialApp, Router, Locale, and Global Theme.
class SpaBookingApp extends StatelessWidget {
  const SpaBookingApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = sl<AppRouter>();
    final sessionManager = sl<SessionManager>();

    final authSessionBloc = sl<AuthSessionBloc>();

    return BlocProvider.value(
      value: authSessionBloc,
      child: MaterialApp.router(
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
      ),
    );
  }
}

// Alias for MainApp if referenced interchangeably
typedef MainApp = SpaBookingApp;
