import 'package:auto_route/auto_route.dart';
import 'package:board_oi/src/app/router/app_router.gr.dart';
import 'package:board_oi/src/app/router/guards/auth_guard.dart';
import 'package:board_oi/src/app/router/guards/guest_guard.dart';
import 'package:board_oi/src/app/session/app_session.dart';
import 'package:board_oi/src/app/session/session_manager.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSessionManager extends Mock implements SessionManager {}

class MockNavigationResolver extends Mock implements NavigationResolver {}

class MockStackRouter extends Mock implements StackRouter {}

void main() {
  late MockSessionManager mockSessionManager;
  late MockNavigationResolver mockResolver;
  late MockStackRouter mockRouter;

  setUpAll(() {
    registerFallbackValue(const RootRoute());
    registerFallbackValue(const LoginRoute());
  });

  setUp(() {
    mockSessionManager = MockSessionManager();
    mockResolver = MockNavigationResolver();
    mockRouter = MockStackRouter();

    when(() => mockRouter.push(any())).thenAnswer((_) async => null);
    when(() => mockRouter.replace(any())).thenAnswer((_) async => null);
  });

  group('AuthGuard', () {
    test('calls resolver.next(true) when session is authenticated', () {
      when(
        () => mockSessionManager.currentSession,
      ).thenReturn(const AppSession.authenticated(userId: 'usr_1'));

      final guard = AuthGuard(mockSessionManager);
      guard.onNavigation(mockResolver, mockRouter);

      verify(() => mockResolver.next(true)).called(1);
      verifyNever(() => mockRouter.push(any()));
    });

    test(
      'calls resolver.next(false) and pushes LoginRoute when unauthenticated',
      () {
        when(
          () => mockSessionManager.currentSession,
        ).thenReturn(const AppSession.unauthenticated());

        final guard = AuthGuard(mockSessionManager);
        guard.onNavigation(mockResolver, mockRouter);

        verify(() => mockResolver.next(false)).called(1);
        verify(() => mockRouter.push(const LoginRoute())).called(1);
      },
    );
  });

  group('GuestGuard', () {
    test(
      'calls resolver.next(false) and redirects to RootRoute when authenticated',
      () {
        when(
          () => mockSessionManager.currentSession,
        ).thenReturn(const AppSession.authenticated(userId: 'usr_1'));

        final guard = GuestGuard(mockSessionManager);
        guard.onNavigation(mockResolver, mockRouter);

        verify(() => mockResolver.next(false)).called(1);
        verify(() => mockRouter.replace(const RootRoute())).called(1);
      },
    );

    test('calls resolver.next(true) when unauthenticated', () {
      when(
        () => mockSessionManager.currentSession,
      ).thenReturn(const AppSession.unauthenticated());

      final guard = GuestGuard(mockSessionManager);
      guard.onNavigation(mockResolver, mockRouter);

      verify(() => mockResolver.next(true)).called(1);
      verifyNever(() => mockRouter.replace(any()));
    });
  });
}
