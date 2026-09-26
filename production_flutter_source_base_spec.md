# Production-Grade Flutter Source Base
## Senior Flutter Developer Implementation Specification

> **Purpose:** Build a reusable, production-grade Flutter source base for scalable iOS, Android, Web, and Desktop applications.
>
> **Architecture:** Feature-first Clean Architecture + DDD boundaries + BLoC
>
> **Core foundations:** AutoRoute, GetIt, Dio, Socket.IO, FlutterSecureStorage, SharedPreferences, native Flutter localization, code generation, testing, design system, environment configuration, and centralized application/session state.
>
> **Important:** This is a **source-base / foundation project**, not a business application. Do not implement domain-specific business features such as booking, trip, wallet, vehicle, salon, board game, etc. Build the reusable infrastructure that future features can safely use.

---

# 1. ROLE AND EXPECTATIONS

You are acting as an **experienced Senior Flutter Engineer / Flutter Architect**.

The implementation must demonstrate:

- Strong Flutter/Dart engineering practices.
- Clean Architecture with real dependency boundaries.
- Feature-first organization suitable for large applications.
- Domain isolation.
- Predictable state management with BLoC.
- Production-grade networking.
- Correct authentication/session lifecycle.
- Safe token refresh under concurrency.
- Correct request idempotency semantics.
- Realtime connection lifecycle management.
- Testability.
- Clear dependency injection.
- Environment separation.
- Localization.
- Reusable design-system primitives.
- Maintainability over clever abstractions.
- Minimal unnecessary dependencies.

Do **not** create architecture merely to make the repository look sophisticated.

Every abstraction must have a clear reason to exist.

---

# 2. PRIMARY OBJECTIVES

Build a source base that makes it easy to add future features using this flow:

```text
UI
 ↓
BLoC
 ↓
Use Case
 ↓
Domain Repository
 ↓
Data Repository
 ↓
Remote / Local Data Source
 ↓
API / Storage
```

For reads:

```text
API JSON
 ↓
Data Model
 ↓
Mapper
 ↓
Domain Entity
 ↓
Use Case
 ↓
BLoC
 ↓
UI
```

For writes:

```text
UI Event
 ↓
BLoC
 ↓
Use Case
 ↓
Domain Repository
 ↓
Data Repository
 ↓
Request Model
 ↓
Remote Data Source
 ↓
API
```

The domain layer must never depend on:

- Flutter UI
- BLoC
- Dio
- SharedPreferences
- FlutterSecureStorage
- Socket.IO
- API models
- Data repositories
- Presentation classes

---

# 3. ARCHITECTURAL PRINCIPLES

## 3.1 Feature-first architecture

Do NOT create one giant global:

```text
data/
domain/
presentation/
```

directory for the entire application.

Use:

```text
lib/
└── src/
    ├── app/
    ├── core/
    ├── shared/
    └── features/
```

Each feature owns its own:

```text
data/
domain/
presentation/
```

This keeps feature boundaries explicit.

---

# 4. TARGET DIRECTORY STRUCTURE

Create the following structure:

```text
lib/
└── src/
    ├── app/
    │   ├── app.dart
    │   ├── bootstrap.dart
    │   │
    │   ├── di/
    │   │   ├── dependency_injection.dart
    │   │   └── registrations.dart
    │   │
    │   ├── router/
    │   │   ├── app_router.dart
    │   │   ├── app_router.gr.dart
    │   │   ├── guards/
    │   │   │   ├── auth_guard.dart
    │   │   │   ├── onboarding_guard.dart
    │   │   │   └── role_guard.dart
    │   │   └── router_refresh_notifier.dart
    │   │
    │   └── session/
    │       ├── app_session.dart
    │       ├── app_session_state.dart
    │       └── session_manager.dart
    │
    ├── core/
    │   ├── config/
    │   │   ├── app_config.dart
    │   │   ├── environment.dart
    │   │   └── environment_loader.dart
    │   │
    │   ├── constants/
    │   │   └── app_constants.dart
    │   │
    │   ├── error/
    │   │   ├── failure.dart
    │   │   ├── exceptions.dart
    │   │   └── failure_mapper.dart
    │   │
    │   ├── network/
    │   │   ├── dio_client.dart
    │   │   ├── network_client.dart
    │   │   ├── interceptors/
    │   │   │   ├── auth_interceptor.dart
    │   │   │   ├── idempotency_interceptor.dart
    │   │   │   ├── logging_interceptor.dart
    │   │   │   └── retry_interceptor.dart
    │   │   ├── auth/
    │   │   │   ├── token_pair.dart
    │   │   │   ├── token_storage.dart
    │   │   │   └── token_refresh_coordinator.dart
    │   │   ├── idempotency/
    │   │   │   ├── idempotency_policy.dart
    │   │   │   └── idempotency_key_store.dart
    │   │   └── api/
    │   │       ├── api_response.dart
    │   │       └── api_error_response.dart
    │   │
    │   ├── realtime/
    │   │   ├── socket_client.dart
    │   │   ├── socket_manager.dart
    │   │   ├── socket_connection_state.dart
    │   │   ├── socket_event.dart
    │   │   └── socket_exception.dart
    │   │
    │   ├── storage/
    │   │   ├── secure_storage.dart
    │   │   ├── preferences_storage.dart
    │   │   └── session_storage.dart
    │   │
    │   ├── localization/
    │   │   ├── app_localizations.dart
    │   │   └── generated/
    │   │
    │   ├── logging/
    │   │   ├── app_logger.dart
    │   │   └── log_level.dart
    │   │
    │   ├── extensions/
    │   └── utils/
    │
    ├── shared/
    │   ├── design_system/
    │   │   ├── tokens/
    │   │   │   ├── app_colors.dart
    │   │   │   ├── app_spacing.dart
    │   │   │   ├── app_radius.dart
    │   │   │   ├── app_typography.dart
    │   │   │   ├── app_shadows.dart
    │   │   │   └── app_motion.dart
    │   │   │
    │   │   ├── components/
    │   │   │   ├── buttons/
    │   │   │   ├── cards/
    │   │   │   ├── inputs/
    │   │   │   ├── dialogs/
    │   │   │   ├── sheets/
    │   │   │   ├── chips/
    │   │   │   ├── loaders/
    │   │   │   └── navigation/
    │   │   │
    │   │   └── theme/
    │   │       ├── app_theme.dart
    │   │       ├── light_theme.dart
    │   │       └── dark_theme.dart
    │   │
    │   ├── widgets/
    │   ├── dialogs/
    │   ├── bottom_sheets/
    │   ├── loading/
    │   └── empty_states/
    │
    └── features/
        └── example/
            ├── data/
            │   ├── datasources/
            │   ├── models/
            │   ├── mappers/
            │   └── repositories/
            │
            ├── domain/
            │   ├── entities/
            │   ├── repositories/
            │   └── usecases/
            │
            └── presentation/
                ├── bloc/
                ├── pages/
                ├── sessions/
                └── widgets/
```

The `example` feature is optional. If created, it must be a tiny architecture demonstration and must not contain fake business logic.

---

# 5. DEPENDENCY DIRECTION

Enforce this rule:

```text
app
 ↓
features / shared / core
```

Feature dependency:

```text
presentation → domain
data → domain
domain → core (only when genuinely infrastructure-independent)
```

Never:

```text
domain → data
domain → presentation
data → presentation
core → feature
feature A → feature B
```

If two features need common behavior, move the stable abstraction to:

```text
core/
```

or:

```text
shared/
```

Do not create direct feature-to-feature coupling.

---

# 6. DOMAIN LAYER

The domain layer represents business meaning.

Example:

```dart
class Trip {
  final String id;
  final TripStatus status;

  const Trip({
    required this.id,
    required this.status,
  });
}
```

The domain must NOT import:

```dart
trip_model.dart
dio.dart
flutter_bloc.dart
shared_preferences.dart
socket_io_client.dart
```

## Domain repository

```dart
abstract interface class TripRepository {
  Future<Either<Failure, Trip?>> getActiveTrip();

  Future<Either<Failure, Trip>> acceptTrip(String tripId);
}
```

## Use case

```dart
class GetActiveTripUseCase {
  final TripRepository repository;

  const GetActiveTripUseCase(this.repository);

  Future<Either<Failure, Trip?>> call() {
    return repository.getActiveTrip();
  }
}
```

Do NOT return:

```dart
TripModel
```

from the domain.

Correct:

```text
TripModel → Trip
```

---

# 7. DATA LAYER

Data owns API/storage implementation.

Example:

```text
data/
├── datasources/
│   ├── trip_remote_data_source.dart
│   └── trip_local_data_source.dart
│
├── models/
│   └── trip_model.dart
│
├── mappers/
│   └── trip_mapper.dart
│
└── repositories/
    └── trip_repository_impl.dart
```

Example model:

```dart
@JsonSerializable()
class TripModel {
  final String id;
  final String status;

  const TripModel({
    required this.id,
    required this.status,
  });

  factory TripModel.fromJson(Map<String, dynamic> json) =>
      _$TripModelFromJson(json);

  Map<String, dynamic> toJson() => _$TripModelToJson(this);
}
```

Mapper:

```dart
extension TripModelMapper on TripModel {
  Trip toEntity() {
    return Trip(
      id: id,
      status: TripStatus.fromApi(status),
    );
  }
}
```

The mapper is the boundary between API representation and domain representation.

---

# 8. API ENUMS MUST NOT LEAK INTO DOMAIN

Do not use backend enums directly inside domain.

Bad:

```dart
final ApiTripStatus status;
```

Good:

```dart
final TripStatus status;
```

Map:

```text
API enum
 ↓
Data enum / raw value
 ↓
Domain enum
```

This protects the domain from backend naming changes.

---

# 9. BLoC ARCHITECTURE

Use:

```text
flutter_bloc
```

BLoC is the presentation/application state mechanism.

Preferred structure:

```text
presentation/
└── bloc/
    ├── feature_bloc.dart
    ├── feature_event.dart
    └── feature_state.dart
```

## Important BLoC rule

Do NOT create dozens of tiny state classes unless they provide real semantic value.

Prefer one state object containing explicit fields:

```dart
class FeatureState extends Equatable {
  final bool isLoading;
  final bool isRefreshing;
  final Object? data;
  final Failure? failure;

  const FeatureState({
    this.isLoading = false,
    this.isRefreshing = false,
    this.data,
    this.failure,
  });

  FeatureState copyWith({
    bool? isLoading,
    bool? isRefreshing,
    Object? data,
    Failure? failure,
  }) {
    ...
  }

  @override
  List<Object?> get props => [
    isLoading,
    isRefreshing,
    data,
    failure,
  ];
}
```

Use normal immutable classes + Equatable for BLoC state.

Do NOT require Freezed for BLoC state.

Freezed may be used for:

- data models
- immutable domain entities
- value objects

when it provides clear value.

---

# 10. BLoC RULES

BLoC must:

- receive events
- invoke use cases
- transform results into presentation state
- never call Dio directly
- never access SharedPreferences directly
- never access SecureStorage directly
- never construct repositories
- never navigate directly when navigation is a session/router concern

Example:

```text
UI
 ↓
Bloc.add()
 ↓
Bloc
 ↓
UseCase
 ↓
Repository
```

---

# 11. ERROR HANDLING

Use a domain-safe `Failure`.

Example:

```dart
sealed class Failure {
  const Failure();
}

class NetworkFailure extends Failure {
  final String message;

  const NetworkFailure(this.message);
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure();
}

class ValidationFailure extends Failure {
  final String message;

  const ValidationFailure(this.message);
}

class ServerFailure extends Failure {
  final String message;

  const ServerFailure(this.message);
}
```

Use:

```dart
Either<Failure, T>
```

for domain/application operations where explicit failure handling is useful.

Do not expose:

```text
DioException
SocketException
FlutterSecureStorage exceptions
```

from domain.

Map infrastructure exceptions into application/domain failures.

---

# 12. DIO NETWORKING

Build a centralized Dio client.

Responsibilities:

- base URL
- common headers
- authentication
- request timeout
- response parsing
- error mapping
- idempotency policy
- retry policy
- token refresh

Do not let every feature instantiate its own Dio.

---

# 13. ENVIRONMENT CONFIGURATION

Do NOT hard-code:

```text
192.168.x.x
localhost
production URLs
socket URLs
API keys
```

into source code.

Support:

```text
development
staging
production
```

Recommended approach:

```text
--dart-define-from-file
```

Example conceptual configuration:

```json
{
  "APP_ENV": "development",
  "API_BASE_URL": "http://192.168.x.x:3000/api/v1",
  "SOCKET_URL": "http://192.168.x.x:3000"
}
```

REST URL and Socket URL must be independent configuration values.

Do NOT derive:

```dart
socketUrl = baseUrl.replaceAll('/api/v1', '');
```

because deployment topology may differ.

---

# 14. APP CONFIG

Create:

```dart
class AppConfig {
  final Environment environment;
  final String apiBaseUrl;
  final String socketUrl;

  const AppConfig({
    required this.environment,
    required this.apiBaseUrl,
    required this.socketUrl,
  });
}
```

Configuration must be immutable.

Validate required values during bootstrap.

Fail fast when configuration is invalid.

---

# 15. AUTHENTICATION ARCHITECTURE

Use:

```text
Access Token
Refresh Token
```

Store sensitive tokens using:

```text
FlutterSecureStorage
```

Do not store refresh tokens in SharedPreferences.

Create:

```text
TokenStorage
SessionStorage
TokenRefreshCoordinator
```

---

# 16. TOKEN REFRESH COORDINATION

Do NOT simply:

```text
401 → clearAuth()
```

because multiple requests can fail simultaneously.

Correct behavior:

```text
Request A → 401
Request B → 401
Request C → 401

       ↓

TokenRefreshCoordinator

       ↓

ONE refresh request

       ↓

New access token

       ↓

Retry A
Retry B
Retry C
```

Only one refresh request may execute at a time.

All waiting requests should await the same refresh operation.

If refresh fails:

```text
clear session
 ↓
SessionManager
 ↓
Unauthenticated / SessionExpired
 ↓
Router reacts
```

Dio must NOT directly navigate to login.

---

# 17. AUTH INTERCEPTOR

Responsibilities:

- attach access token
- detect 401
- delegate refresh to coordinator
- retry the original request when appropriate

Avoid infinite loops.

Refresh requests themselves must not recursively trigger refresh.

Use request metadata such as:

```text
skipAuth
skipRefresh
isRetry
```

when needed.

---

# 18. IDEMPOTENCY

Do NOT generate a new idempotency key for every HTTP request.

Bad:

```dart
options.headers['X-Idempotency-Key'] = const Uuid().v4();
```

for every request.

This breaks retry semantics.

Correct model:

```text
Logical operation
      ↓
ONE idempotency key
      ↓
Request
      ↓
Retry
      ↓
Same idempotency key
```

Example:

```text
CreateBooking
idempotencyKey = abc-123

POST attempt #1 → abc-123
timeout

POST attempt #2 → abc-123
```

Only operations requiring idempotency should use this mechanism.

Typical candidates:

```text
POST create
POST payment
POST accept
POST confirm
POST cancel
```

GET requests normally do not need an idempotency key.

The architecture must distinguish:

```text
retry policy
```

from:

```text
idempotency policy
```

---

# 19. IDEMPOTENCY API

Provide a way for application operations to supply a key.

Example:

```dart
final requestOptions = RequestOptions(
  path: '/bookings',
  method: 'POST',
  extra: {
    'idempotencyKey': operationKey,
  },
);
```

Or provide a clean wrapper at the network-client level.

The exact implementation may differ, but the semantic rule must remain:

> Retries of the same logical write operation reuse the same idempotency key.

---

# 20. RETRY POLICY

Do not blindly retry every request.

Retry only safe/retryable failures.

Examples:

Potentially retryable:

- connection timeout
- temporary network failure
- transient 5xx

Usually not retry:

- 400
- 401 before refresh handling
- 403
- 404
- validation errors
- business rule errors

For non-idempotent writes, retry only when the operation has an idempotency key or the server contract explicitly guarantees safety.

---

# 21. NETWORK LOGGING

Logging must be environment-aware.

Development:

```text
request
headers
body
response
duration
error
```

Production:

- no sensitive token logging
- no passwords
- no OTPs
- no authorization headers
- no payment secrets

Redact sensitive headers.

Create:

```text
AppLogger
```

rather than scattered `print()` calls.

---

# 22. STORAGE

Separate storage responsibilities.

```text
core/storage/
├── secure_storage.dart
├── preferences_storage.dart
└── session_storage.dart
```

## Secure storage

Use for:

- access token
- refresh token
- sensitive session credentials

## Preferences storage

Use for:

- language
- theme
- onboarding flags
- non-sensitive preferences

Do NOT use SharedPreferences as a database.

Features must not directly instantiate either storage implementation.

---

# 23. SESSION MANAGER

Create centralized session state.

Example:

```dart
enum AppSessionStatus {
  unauthenticated,
  authenticating,
  authenticated,
  sessionExpired,
  loggingOut,
}
```

Create:

```text
AppSession
SessionManager
```

Responsibilities:

- restore session
- login state
- logout
- token update
- session expiration
- expose session stream/state

Architecture:

```text
Network
 ↓
SessionManager
 ↓
AppSession
 ↓
Router / AppShell
```

Do not make every BLoC rediscover authentication.

---

# 24. ROUTING

Use AutoRoute.

Routing should support:

```text
AuthGuard
OnboardingGuard
RoleGuard
```

Example:

```text
Unauthenticated
 → Login

Authenticated
 → Main App

Authenticated + incomplete onboarding
 → Onboarding

Authenticated + required role
 → Role-specific area
```

Guards should read application/session state.

Pages should not contain scattered:

```dart
if (!loggedIn) ...
```

routing decisions.

---

# 25. ROUTER REFRESH

When session changes:

```text
SessionManager
 ↓
Router refresh
 ↓
AutoRoute guards reevaluate
```

Avoid manually pushing login from random services.

The application session is the source of truth.

---

# 26. SOCKET.IO REALTIME

Create:

```text
core/realtime/
├── socket_client.dart
├── socket_manager.dart
├── socket_connection_state.dart
├── socket_event.dart
└── socket_exception.dart
```

Responsibilities:

- connect
- disconnect
- reconnect
- authenticate
- subscribe
- unsubscribe
- connection state
- event stream
- lifecycle cleanup

---

# 27. REALTIME RULE

REST is authoritative.

Socket is realtime notification / synchronization.

Preferred architecture:

```text
REST
 ↓
Canonical state

Socket
 ↓
"Something changed"
 ↓
Refresh / patch state
```

Do not blindly treat arbitrary socket payloads as canonical entities unless the backend contract explicitly guarantees it.

Example:

```text
trip.updated
 ↓
TripBloc receives event
 ↓
fetch latest trip
```

or:

```text
trip.updated
 ↓
validated event payload
 ↓
update local state
```

depending on the contract.

---

# 28. SOCKET LIFECYCLE

Socket must not remain connected forever without ownership.

Support:

```text
authenticated
 ↓
connect

logout
 ↓
disconnect

session expired
 ↓
disconnect

app background
 ↓
optional lifecycle policy

app foreground
 ↓
reconnect if needed
```

Do not let each feature independently create its own global Socket.IO client.

---

# 29. FEATURE SOCKET DATA SOURCES

Features may create adapters around the core socket manager.

Example:

```text
features/trip/data/datasources/
└── trip_realtime_data_source.dart
```

It may listen to:

```text
trip.updated
trip.status_changed
```

But it should not own the global socket connection.

---

# 30. BOOTSTRAP

Create:

```text
main.dart
src/app/bootstrap.dart
```

Bootstrap order:

```text
main()
 ↓
Flutter initialization
 ↓
Environment
 ↓
Logger
 ↓
Storage
 ↓
Dependency Injection
 ↓
Session restoration
 ↓
Firebase / platform services if required
 ↓
runApp()
```

Use an explicit:

```dart
AppBootstrap.run();
```

style lifecycle.

Bootstrap should be deterministic.

---

# 31. DEPENDENCY INJECTION

Use GetIt.

Keep registration centralized.

Example:

```text
app/di/
├── dependency_injection.dart
└── registrations.dart
```

Register:

```text
AppConfig
Logger
SecureStorage
PreferencesStorage
SessionStorage
TokenRefreshCoordinator
Dio
SocketManager
SessionManager
Repositories
UseCases
Blocs
```

Do not create dependencies inside widgets.

Bad:

```dart
final repository = TripRepositoryImpl(
  Dio(),
);
```

Good:

```dart
context.read<TripBloc>();
```

with the dependency graph configured in DI.

---

# 32. DI LIFECYCLE

Use appropriate lifetimes.

Singleton examples:

```text
AppConfig
Logger
Dio
TokenRefreshCoordinator
SessionManager
SocketManager
Storage
```

Factory examples:

```text
UseCases
BLoCs
Feature-specific data sources where appropriate
```

Do not make every object a singleton.

---

# 33. LOCALIZATION

Use Flutter's native localization system.

Source files:

```text
l10n/
├── app_en.arb
└── app_vi.arb
```

Generated files should live separately:

```text
lib/src/core/localization/generated/
```

Do not manually edit generated localization files.

All user-visible strings should be localizable.

Domain/business logic must not depend on localized strings.

---

# 34. DESIGN SYSTEM

Create a reusable design system.

```text
shared/design_system/
├── tokens/
├── components/
└── theme/
```

Tokens:

```text
colors
spacing
radius
typography
shadows
motion
```

Components:

```text
buttons
cards
inputs
dialogs
bottom sheets
chips
loaders
navigation
```

The source base should have a clean visual foundation, but must remain generic.

Do not build a domain-specific visual language.

---

# 35. THEME

Support:

```text
Light
Dark
System
```

Theme must be centralized.

Avoid hardcoded:

```dart
Colors.blue
EdgeInsets.all(17)
BorderRadius.circular(13)
```

throughout feature code.

Prefer:

```dart
context.theme
AppSpacing.md
AppRadius.md
AppColors...
```

where appropriate.

---

# 36. SHARED UI

Only put genuinely reusable UI into:

```text
shared/
```

Examples:

```text
AppButton
AppTextField
AppCard
AppDialog
AppBottomSheet
AppLoading
AppEmptyState
```

Do not move feature-specific widgets into shared just because they are visually reusable once.

---

# 37. CODE GENERATION

Use code generation where it provides value.

Possible tools:

```text
build_runner
json_serializable
freezed
auto_route_generator
```

Do not introduce generators unnecessarily.

Generated files must never be manually edited.

---

# 38. PACKAGE POLICY

Use stable, well-maintained packages.

Core expected packages:

```text
flutter_bloc
equatable
get_it
fpdart
auto_route
dio
socket_io_client
uuid
shared_preferences
flutter_secure_storage
intl
json_annotation
```

Development/code generation as required:

```text
build_runner
json_serializable
auto_route_generator
freezed
freezed_annotation
```

Only add a package when there is a concrete architectural requirement.

Do not add:

```text
provider
riverpod
get
bloc + cubit + provider
```

just to provide alternatives.

Use one primary state-management approach:

```text
BLoC
```

---

# 39. DO NOT OVERUSE FREEZED

Freezed is allowed but not mandatory.

Recommended:

```text
API models → Freezed/json_serializable
Domain entities → Freezed where useful
BLoC states → normal immutable Equatable classes
BLoC events → Equatable or Freezed depending on complexity
```

The architecture must not become generator-dependent for trivial classes.

---

# 40. USE CASE POLICY

Do not create use cases mechanically for every repository method.

Good use cases:

```text
CreateBooking
CancelBooking
AcceptTrip
StartTrip
CompleteTrip
SubmitResult
ConfirmResult
GetActiveTrip
```

Avoid meaningless wrappers when they add no business/application value.

The goal is application behavior, not maximum file count.

---

# 41. TESTING ARCHITECTURE

Create:

```text
test/
├── core/
├── app/
├── features/
│   └── example/
└── helpers/
```

Tests should cover:

## Domain

- use case success
- use case failure
- repository contract behavior

## Data

- JSON serialization
- JSON deserialization
- mapping
- repository error conversion

## Network

- auth interceptor
- token refresh
- concurrent 401 handling
- retry behavior
- idempotency behavior

## Session

- restore session
- login
- logout
- session expiration

## BLoC

- event → state
- loading
- success
- failure
- refresh
- session-related behavior

## Routing

- unauthenticated
- authenticated
- onboarding
- role guard

---

# 42. TOKEN REFRESH TEST

This test is mandatory.

Simulate:

```text
Request A → 401
Request B → 401
Request C → 401
```

Assert:

```text
refresh endpoint called exactly once
```

Then:

```text
A retried
B retried
C retried
```

using the new access token.

---

# 43. IDEMPOTENCY TEST

Mandatory test:

```text
logical operation
 ↓
POST
 ↓
timeout
 ↓
retry
```

Assert:

```text
same X-Idempotency-Key
```

across both attempts.

Also assert that ordinary GET requests do not receive unnecessary idempotency keys.

---

# 44. SESSION TEST

Test:

```text
valid stored token
 ↓
restore
 ↓
authenticated
```

and:

```text
refresh failure
 ↓
clear tokens
 ↓
sessionExpired / unauthenticated
```

---

# 45. SECURITY

Never commit:

```text
API secrets
private keys
production credentials
refresh tokens
passwords
OTP values
```

Do not log:

```text
Authorization
Cookie
password
OTP
payment secret
refresh token
```

Redact sensitive values.

Environment files containing secrets must be excluded from source control when appropriate.

---

# 46. API RESPONSE CONTRACT

Support APIs that may return an envelope such as:

```json
{
  "statusCode": 200,
  "data": {},
  "message": "Success"
}
```

Create generic infrastructure support where useful:

```dart
ApiResponse<T>
```

Do not force every feature to manually unwrap:

```text
response.data.data.data
```

The network/data layer should normalize the response.

---

# 47. ERROR MAPPING

Map:

```text
DioException
HTTP status
API error body
network exception
timeout
serialization failure
```

into:

```text
Failure
```

Example mapping:

```text
400 → ValidationFailure
401 → UnauthorizedFailure
403 → ForbiddenFailure
404 → NotFoundFailure
409 → ConflictFailure
422 → ValidationFailure
429 → RateLimitFailure
5xx → ServerFailure
timeout → NetworkFailure
offline → NetworkFailure
```

Exact application mapping may be adapted to the backend contract.

---

# 48. OBSERVABILITY

Create centralized logging.

Support levels:

```text
debug
info
warning
error
```

Allow:

```text
development verbose logging
production restricted logging
```

Do not use random `print()` statements.

---

# 49. APP LIFECYCLE

Consider:

```text
AppLifecycleState.resumed
AppLifecycleState.inactive
AppLifecycleState.paused
```

Use lifecycle handling only where needed.

Potential responsibilities:

```text
socket reconnection
session refresh
foreground synchronization
```

Avoid creating unnecessary global lifecycle complexity.

---

# 50. EXAMPLE FEATURE

If an example feature is implemented, use a minimal:

```text
example/
├── data/
├── domain/
└── presentation/
```

It should demonstrate:

```text
API Model
 ↓
Mapper
 ↓
Entity
 ↓
Repository
 ↓
UseCase
 ↓
BLoC
 ↓
Page
```

Do not implement real booking/trip/wallet business logic.

---

# 51. QUALITY RULES

The final source must follow:

## Dart

- sound null safety
- immutable state where practical
- explicit types for public APIs
- no unnecessary dynamic
- no giant classes
- no giant methods
- no hidden global state
- meaningful names

## Flutter

- dispose resources correctly
- avoid unnecessary rebuilds
- do not perform network calls directly in build
- do not create controllers repeatedly in build
- use const constructors where appropriate

## Architecture

- no domain → data imports
- no domain → presentation imports
- no feature → feature coupling unless explicitly justified
- no networking inside widgets
- no storage access inside widgets
- no navigation inside Dio
- no token refresh logic inside individual features

---

# 52. LINTING

Use a strict but practical lint configuration.

At minimum:

```text
flutter_lints
```

Prefer adding project-specific rules only when they provide clear value.

Do not create hundreds of style rules that slow development.

---

# 53. FORMAT / ANALYZE / TEST

The project must pass:

```bash
dart format --set-exit-if-changed .
flutter analyze
flutter test
```

If code generation is configured:

```bash
dart run build_runner build --delete-conflicting-outputs
```

or the project's equivalent script.

---

# 54. BUILD VERIFICATION

Verify at least:

```bash
flutter analyze
flutter test
```

For supported targets, verify an appropriate build.

Examples:

```bash
flutter build apk --debug
flutter build ios --no-codesign
flutter build web
```

Do not run a platform build if the environment does not support that platform; report the limitation accurately.

---

# 55. MAKEFILE / SCRIPTS

Create simple developer commands where useful.

Example:

```makefile
get:
	fvm flutter pub get

gen:
	fvm dart run build_runner build --delete-conflicting-outputs

format:
	fvm dart format .

analyze:
	fvm flutter analyze

test:
	fvm flutter test

check:
	fvm dart format --set-exit-if-changed .
	fvm flutter analyze
	fvm flutter test

clean:
	fvm flutter clean
	fvm flutter pub get
```

If FVM is not part of the existing project, do not force it. Preserve the repository's existing Flutter command convention.

---

# 56. FVM

If the repository already uses FVM:

```text
.fvmrc
```

and:

```bash
fvm flutter ...
fvm dart ...
```

must be respected.

Do not silently change the project's Flutter version.

If no version exists, inspect the repository and current environment before choosing one.

---

# 57. GENERATED FILE POLICY

Generated files:

```text
*.g.dart
*.gr.dart
```

must not be manually edited.

The implementation must ensure generation is deterministic.

When generated files are required, run the generator and verify the generated output.

---

# 58. README

Create/update:

```text
README.md
```

It must explain:

```text
Project architecture
Directory structure
Setup
Environment configuration
Code generation
Running the app
Testing
Formatting
Analysis
Adding a feature
Authentication/session flow
Networking
Localization
```

Include a concise architecture diagram.

---

# 59. FEATURE CREATION GUIDE

Document the standard process for adding a feature.

Example:

```text
1. Create feature directory
2. Define domain entities
3. Define repository contract
4. Define use cases
5. Create API models
6. Create mapper
7. Create data source
8. Implement repository
9. Create BLoC
10. Create page/widgets
11. Register dependencies
12. Register routes
13. Add localization
14. Add tests
```

---

# 60. STANDARD FEATURE TEMPLATE

Every future feature should look approximately like:

```text
features/
└── feature_name/
    ├── data/
    │   ├── datasources/
    │   ├── models/
    │   ├── mappers/
    │   └── repositories/
    │
    ├── domain/
    │   ├── entities/
    │   ├── repositories/
    │   └── usecases/
    │
    └── presentation/
        ├── bloc/
        ├── pages/
        ├── sessions/
        └── widgets/
```

---

# 61. DOMAIN ENTITY VS API MODEL

This distinction is mandatory.

API:

```json
{
  "id": "123",
  "status": "IN_PROGRESS",
  "created_at": "..."
}
```

Data:

```dart
TripModel
```

Domain:

```dart
Trip
```

The domain should not care whether the API uses:

```text
snake_case
camelCase
MongoDB ObjectId
REST
GraphQL
WebSocket
```

The data layer absorbs those concerns.

---

# 62. REPOSITORY IMPLEMENTATION

Example:

```dart
class TripRepositoryImpl implements TripRepository {
  final TripRemoteDataSource remoteDataSource;

  const TripRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, Trip?>> getActiveTrip() async {
    try {
      final model = await remoteDataSource.getActiveTrip();

      return Right(model?.toEntity());
    } on UnauthorizedException {
      return const Left(UnauthorizedFailure());
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
```

Keep infrastructure exceptions out of domain.

---

# 63. PRESENTATION SESSION

For complex features, presentation may have:

```text
sessions/
```

for reusable UI/session behavior.

Examples:

```text
pagination session
filter session
selection session
search session
```

Do not create session classes unless the feature genuinely needs them.

---

# 64. PAGINATION

The source base should be designed to support:

```text
page-based pagination
cursor pagination
infinite scrolling
refresh
load more
```

Do not prematurely create a huge generic pagination framework.

Provide simple primitives and allow features to implement their own semantics.

---

# 65. CACHING

Do not create a global cache framework unless required.

Caching should be feature-aware.

Possible layers:

```text
memory
local storage
remote API
```

The source base may define interfaces, but concrete caching should be introduced only where necessary.

---

# 66. OFFLINE SUPPORT

Do not pretend the source base is offline-first unless implemented.

If offline behavior is not required:

```text
network unavailable
 ↓
NetworkFailure
```

Keep architecture extensible for future local data sources.

---

# 67. FIREBASE

If the project requires Firebase:

- initialize Firebase during bootstrap
- keep Firebase-specific infrastructure out of domain
- register services through DI
- do not access Firebase directly from UI where avoidable

If Firebase is not required by the current source base, do not add it merely for completeness.

---

# 68. RESPONSIBILITY MATRIX

| Layer | Responsibility |
|---|---|
| App | bootstrap, DI, routing, session |
| Core | infrastructure and cross-cutting concerns |
| Shared | reusable UI/design primitives |
| Feature Domain | business concepts and rules |
| Feature Data | API/local implementations |
| Feature Presentation | BLoC and UI |

---

# 69. ANTI-PATTERNS TO AVOID

Do NOT create:

```text
BaseBloc<T>
BaseState<T>
BaseRepository<T>
BaseUseCase<T>
BasePage<T>
BaseWidget<T>
```

unless there is a demonstrated repeated behavior that genuinely benefits from abstraction.

Avoid:

```text
God classes
God services
service locator everywhere
static mutable globals
navigation inside repositories
navigation inside Dio
API models in domain
Dio calls inside BLoC
storage calls inside widgets
feature-to-feature imports
duplicated token refresh logic
duplicated socket clients
duplicated error parsing
```

---

# 70. IMPLEMENTATION PHASES

Implement in this order.

## Phase 1 — Inspect repository

Before changing anything:

```text
Inspect:
- pubspec.yaml
- lib/
- test/
- analysis_options.yaml
- l10n configuration
- build scripts
- FVM configuration
- existing routing
- existing DI
- existing Firebase configuration
```

Do not overwrite existing working architecture blindly.

If adapting an existing project, preserve useful existing conventions.

---

## Phase 2 — Project foundation

Implement:

```text
app/
core/
shared/
features/
```

and configuration.

---

## Phase 3 — Error model

Implement:

```text
Failure
Exceptions
FailureMapper
```

---

## Phase 4 — Storage

Implement:

```text
SecureStorage
PreferencesStorage
SessionStorage
TokenStorage
```

---

## Phase 5 — Networking

Implement:

```text
DioClient
AuthInterceptor
TokenRefreshCoordinator
IdempotencyPolicy
RetryPolicy
FailureMapper
Logging
```

---

## Phase 6 — Session

Implement:

```text
AppSession
SessionManager
```

including restoration and expiration.

---

## Phase 7 — Routing

Implement:

```text
AutoRoute
AuthGuard
OnboardingGuard
RoleGuard
RouterRefresh
```

---

## Phase 8 — Realtime

Implement:

```text
SocketClient
SocketManager
ConnectionState
```

including authentication and lifecycle.

---

## Phase 9 — Localization

Implement:

```text
app_en.arb
app_vi.arb
generated localization
```

and configure Flutter l10n.

---

## Phase 10 — Design system

Implement:

```text
tokens
theme
buttons
inputs
cards
dialogs
loaders
navigation
```

Only generic components.

---

## Phase 11 — Example feature

Implement a minimal architecture example demonstrating:

```text
model
mapper
entity
repository
use case
BLoC
page
tests
```

---

## Phase 12 — Tests

Implement infrastructure tests for:

```text
refresh coordinator
idempotency
session
mapping
BLoC
routing
```

---

## Phase 13 — Quality gates

Run:

```bash
dart format --set-exit-if-changed .
flutter analyze
flutter test
```

Then run supported platform builds.

Fix all errors.

---

# 71. ACCEPTANCE CRITERIA

The source base is complete only when all conditions below are satisfied.

## Architecture

- [ ] Feature-first structure exists.
- [ ] Domain is isolated from data/presentation.
- [ ] Data implements domain repositories.
- [ ] API models never leak into domain.
- [ ] Explicit mappers exist.
- [ ] No unnecessary feature-to-feature coupling.

## Networking

- [ ] Central Dio client exists.
- [ ] Auth interceptor exists.
- [ ] Token refresh coordinator exists.
- [ ] Concurrent 401s cause one refresh request.
- [ ] Failed refresh clears session.
- [ ] Dio never navigates.
- [ ] Retry policy exists.
- [ ] Idempotency is operation-based.
- [ ] Retries reuse the same idempotency key.
- [ ] GET does not receive unnecessary idempotency keys.
- [ ] Sensitive logs are redacted.

## Session

- [ ] Session restoration works.
- [ ] Login/session state is centralized.
- [ ] Logout clears sensitive storage.
- [ ] Session expiration propagates to router.

## Routing

- [ ] AutoRoute configured.
- [ ] Auth guard exists.
- [ ] Router reacts to session state.
- [ ] No scattered manual auth navigation.

## Realtime

- [ ] Central Socket.IO manager exists.
- [ ] Connection state is exposed.
- [ ] Socket authentication is handled.
- [ ] Disconnect/logout cleanup works.
- [ ] Reconnect behavior exists.
- [ ] Features do not create independent global sockets.

## Localization

- [ ] Native Flutter l10n configured.
- [ ] English exists.
- [ ] Vietnamese exists.
- [ ] Generated files are separated.
- [ ] UI strings are localizable.

## Design System

- [ ] Theme exists.
- [ ] Tokens exist.
- [ ] Generic reusable components exist.
- [ ] Light/dark/system behavior is supported.

## Testing

- [ ] Core tests exist.
- [ ] Refresh concurrency is tested.
- [ ] Idempotency retry is tested.
- [ ] Mapping is tested.
- [ ] Session behavior is tested.
- [ ] BLoC behavior is tested.

## Quality

- [ ] Formatting passes.
- [ ] Analyze passes.
- [ ] Tests pass.
- [ ] Supported builds pass.
- [ ] README explains architecture and setup.

---

# 72. FINAL IMPLEMENTATION RULE

The goal is not to create the largest possible architecture.

The goal is to create a **small, strong, extensible foundation** that a senior Flutter team can use for years.

Prioritize:

```text
Correct boundaries
> clever abstractions

Reliable behavior
> maximum abstraction

Explicit dependencies
> hidden magic

Simple BLoC
> state explosion

Stable domain
> API coupling

Correct retry/idempotency
> superficial networking

Central session lifecycle
> scattered auth checks

Reusable design system
> duplicated UI

Tests for critical infrastructure
> meaningless test volume
```

When uncertain, choose the solution that is:

```text
simpler
explicit
testable
replaceable
easy for another senior developer to understand
```

---

# 73. FINAL COMMAND TO THE AI CODING AGENT

Before writing code:

1. Inspect the repository.
2. Identify the existing Flutter/Dart version.
3. Identify existing dependencies.
4. Identify existing architecture.
5. Identify existing generated files.
6. Identify existing l10n configuration.
7. Identify existing Firebase configuration if present.
8. Identify existing routing and DI.
9. Identify existing conventions that should be preserved.
10. Produce a concise implementation plan.

Then implement the source base incrementally.

Do not delete working code without understanding its purpose.

Do not introduce duplicate infrastructure.

Do not add dependencies without justification.

Do not implement business features.

Do not fake APIs.

Do not hard-code production credentials.

Do not use placeholder architecture that cannot actually run.

After implementation:

```bash
dart format --set-exit-if-changed .
flutter analyze
flutter test
```

Run code generation where required.

Run appropriate platform builds where the local environment supports them.

Fix all errors introduced by the implementation.

Finally, report:

```text
1. What was implemented
2. Files/directories created
3. Existing files modified
4. Packages added/changed
5. Architecture decisions
6. Tests added
7. Commands executed
8. Verification results
9. Remaining environment limitations, if any
```

**Do not claim success unless the verification commands actually pass.**
