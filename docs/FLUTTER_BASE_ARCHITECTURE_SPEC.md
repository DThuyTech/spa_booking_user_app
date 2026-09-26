# FLUTTER BASE ARCHITECTURE SPECIFICATION
## Clean Architecture (Domain-Driven Design) + BLoC

This document outlines the architectural standard, layer separation, conventions, and patterns used across the Board Ơi application.

---

## 1. Root Directory Structure

```text
board_oi/
├── android/                    # Native Android configuration (Gradle, Manifest, Kotlin)
├── ios/                        # Native iOS configuration (Xcode workspace, Podfile, Info.plist)
├── assets/                     # Static assets
│   ├── icons/                  # SVG & PNG app icons
│   └── images/                 # Editorial & game visual assets
├── docs/                       # Architecture & specification documentation
│   ├── FLUTTER_BASE_ARCHITECTURE_SPEC.md
│   └── MODULES_DONE_OVERVIEW.md
├── l10n/                       # Localization ARB files (app_en.arb, app_vi.arb)
├── scripts/                    # Automation scripts (build, analyze, test)
├── test/                       # Unit, widget, and BLoC tests
├── l10n.yaml                   # Code generation configuration for localization
├── pubspec.yaml                # Package dependencies & assets declaration
└── lib/                        # Application source code
```

---

## 2. Source Code Architecture (`lib/`)

```text
lib/
├── bootstrap.dart              # Zone initialization, logging, crash reporting & DI boot
├── main.dart                   # Main entrypoint (invokes AppBootstrap.run())
├── main_app.dart               # MaterialApp.router, Global Theme, RouterConfig, Locales
└── src/
    ├── config/                 # Application configuration & framework initializers
    │   ├── app_config.dart     # Base URL, Socket URL, Timeout, Flavors
    │   ├── di/                 # Dependency Injection (GetIt)
    │   │   ├── injection.dart  # Registration of Singletons, LazySingletons, Factories
    │   │   └── injection.config.dart
    │   ├── gen/                # Generated Assets & Localization
    │   │   ├── colors.gen.dart # Color tokens generated from design specs
    │   │   └── l10n/           # AppLocalizations delegates & strings
    │   └── router/             # AutoRoute navigation
    │       ├── auth_guard.dart # Route guard enforcing authentication
    │       ├── router.dart     # Route table and Stack Router declaration
    │       └── router.gr.dart  # Generated route classes
    ├── core/                   # Shared cross-cutting concerns (business-agnostic)
    │   ├── base/               # BaseBloc, BaseState, BaseUseCase
    │   ├── constants/          # AppConstants, AssetConstants, UrlConstants
    │   ├── enums/              # LoadingStatus (initial, loading, success, failure)
    │   ├── error/              # Failure hierarchy & error mappers (fpdart)
    │   ├── exceptions/         # NetworkException, SocketException, StorageException
    │   ├── extensions/         # Context, DateTime, String, and Locale utilities
    │   ├── kt_network/         # Low-level HTTP Client (Dio, Interceptors, Idempotency)
    │   ├── services/           # TimeService, DeviceInfo, Logging, Realtime Socket
    │   ├── utils/              # Debouncer, formatters, validators
    │   └── widgets/            # Core utility widgets (e.g., AppErrorView)
    ├── data/                   # Data Layer (Network, WebSocket, Local Cache)
    │   ├── datasources/
    │   │   ├── local/          # AppCache, SharedPreferences, SecureStorage
    │   │   └── remote/         # Remote API endpoints & mock data sources
    │   ├── enums/              # Backend contract enums
    │   ├── model/              # Data Transfer Objects (DTOs) with JSON serialization
    │   ├── mapper/             # Bi-directional DTO <-> Domain Entity mappers
    │   └── repositories/       # Concrete implementations of Domain Repository contracts
    ├── domain/                 # Domain Layer (Pure Dart, Zero Flutter UI dependencies)
    │   ├── entities/           # Core business entities
    │   ├── params/             # UseCase parameter objects
    │   ├── repositories/       # Abstract Repository contracts / interfaces
    │   └── usecases/           # Single-responsibility business use cases
    ├── exports/                # Aggregated barrel exports for clean imports
    └── presentation/           # Presentation Layer (BLoC, Views, Design System)
        ├── bloc/               # Feature state management (Event -> State)
        ├── theme/              # Design tokens (AppColors, AppTypography, AppSpacing)
        ├── view/               # Screen composition (Body, Sessions, Widgets)
        └── widgets/            # Atomic Design System (buttons, textfields, cards, toast)
```

---

## 3. Layer Separation Rules & Flow of Dependencies

1. **Presentation -> Domain**: UI and BLoC only depend on Domain Entities and Use Cases. Never call DataSources or Repositories directly from UI.
2. **Domain Layer**: Pure Dart code. No imports of `package:flutter`, Dio, or UI elements.
3. **Data -> Domain**: Data repositories implement domain interfaces and convert Models (DTOs) to Entities using Mappers.
4. **Core & Config**: Accessible by any layer for cross-cutting services (Network, Logging, DI, Error handling).
