# Board Oi — Production Flutter Source Base

A production-grade, reusable Flutter source base architected for scalability, maintainability, and clean dependency boundaries across iOS, Android, Web, and Desktop.

---

## 1. Architectural Overview

The project adheres to **Feature-First Clean Architecture + Domain-Driven Design (DDD) Boundaries + BLoC**.

```text
UI (Widgets / Pages)
       ↓
     BLoC
       ↓
   Use Case
       ↓
Domain Repository (Interface)
       ↓
 Data Repository (Implementation)
       ↓
Remote / Local Data Source
       ↓
NetworkClient (Dio) / Storage (Secure & SharedPrefs) / SocketManager
```

### Data Flow & Boundary Isolation

- **Reads:** `API JSON` → `Data Model` (`@JsonSerializable`) → `Mapper` → `Domain Entity` → `Use Case` → `BLoC` → `UI`
- **Writes:** `UI Event` → `BLoC` → `Use Case` → `Domain Repository` → `Data Repository` → `Request / Params` → `Remote Data Source` → `Dio`
- **Domain Independence:** The domain layer contains zero dependencies on Flutter UI, Dio, SharedPreferences, FlutterSecureStorage, Socket.IO, or presentation classes.

---

## 2. Directory Structure

```text
lib/
├── main.dart                                # Application entrypoint invoking AppBootstrap.run()
└── src/
    ├── app/
    │   ├── app.dart                         # Root MaterialApp.router with themes, l10n, BLoC
    │   ├── bootstrap.dart                   # Deterministic startup sequence
    │   ├── di/
    │   │   ├── dependency_injection.dart    # GetIt service locator instance & reset
    │   │   └── registrations.dart           # Centralized dependency registrations
    │   ├── router/
    │   │   ├── app_router.dart              # AutoRoute root configuration
    │   │   ├── app_router.gr.dart           # Generated AutoRoute routes
    │   │   ├── router_refresh_notifier.dart # Session listener triggering router reevaluations
    │   │   └── guards/
    │   │       ├── auth_guard.dart          # Session-aware route guard
    │   │       ├── onboarding_guard.dart    # Onboarding status guard
    │   │       └── role_guard.dart          # Role-based route guard
    │   └── session/
    │       ├── app_session.dart             # Immutable session entity & state
    │       ├── app_session_state.dart       # Session status enum
    │       └── session_manager.dart         # Source of truth for auth & token state
    │
    ├── core/
    │   ├── config/                          # AppConfig, Environment, EnvironmentLoader
    │   ├── constants/                       # AppConstants, storage keys, header definitions
    │   ├── error/                           # Failure hierarchy, AppException, FailureMapper
    │   ├── logging/                         # AppLogger with sensitive credential redaction
    │   ├── network/
    │   │   ├── dio_client.dart              # Centralized Dio wrapper (NetworkClient)
    │   │   ├── network_client.dart          # Network client contract
    │   │   ├── auth/                        # TokenPair, TokenStorage, TokenRefreshCoordinator
    │   │   ├── idempotency/                 # IdempotencyPolicy, UuidIdempotencyKeyStore
    │   │   ├── interceptors/                # Auth, Idempotency, Logging, Retry interceptors
    │   │   └── api/                         # ApiResponse, ApiErrorResponse
    │   ├── realtime/                        # SocketClient, SocketManager, SocketEvent
    │   ├── storage/                         # SecureStorage, PreferencesStorage, SessionStorage
    │   ├── localization/                    # AppLocalizations and context extensions
    │   ├── extensions/                      # BuildContextThemeX
    │   └── utils/                           # Debouncer
    │
    ├── shared/
    │   ├── design_system/
    │   │   ├── tokens/                      # AppColors, AppSpacing, AppRadius, AppTypography, AppShadows, AppMotion
    │   │   ├── theme/                       # AppTheme, LightTheme, DarkTheme
    │   │   └── components/                  # AppButton, AppCard, AppTextField, AppDialog, AppBottomSheet, etc.
    │   ├── empty_states/                    # AppEmptyState
    │   └── loading/                         # AppLoadingIndicator
    │
    └── features/
        ├── auth/
        │   └── presentation/pages/login_page.dart
        └── home/                            # Example feature demonstrating clean architecture
            ├── data/
            │   ├── datasources/home_remote_data_source.dart
            │   ├── models/greeting_model.dart
            │   ├── mappers/greeting_mapper.dart
            │   └── repositories/home_repository_impl.dart
            ├── domain/
            │   ├── entities/greeting.dart
            │   ├── repositories/home_repository.dart
            │   └── usecases/get_greeting_usecase.dart
            └── presentation/
                ├── bloc/home_bloc.dart
                ├── pages/home_page.dart
                └── widgets/home_greeting_card.dart
```

---

## 3. Getting Started

### Prerequisites

- Flutter SDK (3.44.x or higher)
- Dart SDK (3.12.x or higher)

### Setup

```bash
# 1. Install dependencies
make get

# 2. Generate localizations
make l10n

# 3. Generate route and model code
make gen
```

### Running the App

```bash
# Run in development mode
flutter run

# Run with custom environment definitions
flutter run --dart-define=APP_ENV=staging --dart-define=API_BASE_URL=https://staging.api.example.com/api/v1
```

---

## 4. Key Architectural Capabilities

### Concurrency-Safe Token Refresh
When concurrent requests receive a `401 Unauthorized`:
1. `AuthInterceptor` intercepts the 401s and passes control to `TokenRefreshCoordinator`.
2. `TokenRefreshCoordinator` executes **only ONE refresh network request** while all other callers await the same completion.
3. Upon success, all pending requests are retried with the new access token.
4. Upon failure, secure tokens are cleared, `SessionManager` transitions to `sessionExpired`, and the router reacts automatically.

### Operation-Based Idempotency
- Mutating operations (`POST`, `PATCH`) configured with an idempotency key send the `X-Idempotency-Key` header.
- Transient network failures and retries reuse the exact same idempotency key to prevent double actions.
- Safe `GET` queries are guaranteed never to attach unnecessary idempotency keys.

### Centralized Logging & Redaction
`AppLogger` ensures that in production mode, sensitive headers (such as `Authorization`, `Cookie`, `token`, `password`, `secret`) are sanitized and redacted.

---

## 5. Adding a New Feature Guide

To add a new feature (e.g. `profile`):

1. **Create directories:**
   ```text
   lib/src/features/profile/
   ├── data/
   │   ├── datasources/
   │   ├── models/
   │   ├── mappers/
   │   └── repositories/
   ├── domain/
   │   ├── entities/
   │   ├── repositories/
   │   └── usecases/
   └── presentation/
       ├── bloc/
       ├── pages/
       └── widgets/
   ```
2. **Define domain entities:** Create immutable entities in `domain/entities/`.
3. **Define repository contract:** Create domain interface returning `Either<Failure, T>`.
4. **Implement use cases:** Encapsulate discrete business operations in `domain/usecases/`.
5. **Implement API models & mappers:** Use `@JsonSerializable` for models and extension mappers to map `Model` to `Entity`.
6. **Implement repository:** Convert exceptions to domain `Failure` via `FailureMapper`.
7. **Create BLoC:** Handle events, invoke use cases, emit immutable states.
8. **Create UI:** Build pages using design system tokens and components, annotated with `@RoutePage()`.
9. **Register in DI:** Add registrations in `lib/src/app/di/registrations.dart`.
10. **Register in Router:** Add route in `lib/src/app/router/app_router.dart` and run `make gen`.
11. **Add unit & BLoC tests:** Add tests under `test/features/profile/`.

---

## 6. Development Commands

| Command | Action |
|---|---|
| `make get` | Resolve and install dependencies |
| `make l10n` | Generate native Flutter localization files |
| `make gen` | Run build_runner code generation |
| `make format` | Format code with `dart format .` |
| `make analyze` | Run static code analysis with `flutter analyze` |
| `make test` | Run test suite with `flutter test` |
| `make check` | Run format, analyze, and test checks |
| `make clean` | Clean build artifacts and cache |
