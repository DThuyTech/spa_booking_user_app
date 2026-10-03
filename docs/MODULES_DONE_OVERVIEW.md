# MODULES DONE OVERVIEW

## Board Ơi Project Status & Implemented Modules

| Module                        | Layer                 | Status  | Key Components & Files                                                                                                          |
| :---------------------------- | :-------------------- | :------ | :------------------------------------------------------------------------------------------------------------------------------ |
| **Foundation & Architecture** | Config / Core         | ✅ Done | `bootstrap.dart`, `main_app.dart`, `AppConfig`, `GetIt` DI (`injection.dart`), `AppRouter` (`router.dart`)                      |
| **Network & Security**        | Core (kt_network)     | ✅ Done | `DioClient`, `AuthInterceptor`, `TokenRefreshCoordinator`, `IdempotencyInterceptor`                                             |
| **Design System & Theme**     | Presentation          | ✅ Done | Editorial Warm Theme (`#F7F5F0`, `#6B4F3A`, `#C8754D`), `AppTypography`, `AppButton`, `AppTextField`, `AppToast`                |
| **Game Visuals System**       | Presentation / Data   | ✅ Done | `GameArtworkCatalog` (Catan, Azul, Coup, Wingspan, etc.), `DefaultGameVisual` (Vector fallback), `GameVisualCard`               |
| **Events Module**             | Domain / Presentation | ✅ Done | `EventEntity`, `EventsView`, `EventDetailView`, `CreateEventSheet`, `EventSession`                                              |
| **Map Discovery**             | Domain / Presentation | ✅ Done | `MapMarkerEntity`, `MapView`, `SpaBookingMapCanvas`, `MapMarkerPin`, `MapEventPreviewCard`, `EventLocationPickerSheet`          |
| **Match Requests**            | Data / Presentation   | ✅ Done | `MatchRequestCard`, `DiscoverView`, `MatchDetailSheet`, `MatchFilterSheet`                                                      |
| **Player Profile**            | Presentation          | ✅ Done | `ProfileHeaderCard` (1,482 rating), `ProfileFavoriteGames`, `ProfileRecentMatches` (`+24 rating`), `ProfileAchievementsSection` |
| **Authentication & Session**  | Presentation / Domain | ✅ Done | `AuthBloc`, `AuthSession`, `LoginView`, `SessionManager`                                                                        |
