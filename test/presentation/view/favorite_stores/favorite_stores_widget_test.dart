import 'package:board_oi/src/presentation/view/favorite_stores/view/favorite_stores_view.dart';
import 'package:board_oi/src/presentation/view/favorite_stores/widgets/favorite_store_card.dart';
import 'package:board_oi/src/presentation/view/favorite_stores/widgets/favorite_stores_empty_view.dart';
import 'package:board_oi/src/presentation/view/favorite_stores/widgets/favorite_stores_search_bar.dart';
import 'package:board_oi/src/presentation/view/store_detail/view/store_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  group('FavoriteStoresView Test Suite', () {
    testWidgets(
      'renders AppAppBar, search bar, filter button, and favorite store cards',
      (tester) async {
        tester.view.physicalSize = const Size(800, 2400);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() => tester.view.resetPhysicalSize());

        await tester.pumpWidget(const MaterialApp(home: FavoriteStoresView()));
        await tester.pumpAndSettle();

        // App bar title
        expect(find.text('Favorites...'), findsOneWidget);

        // Search bar & Filter
        expect(find.byType(FavoriteStoresSearchBar), findsOneWidget);
        expect(find.text('Search salons, services...'), findsOneWidget);

        // Cards
        expect(find.byType(FavoriteStoreCard), findsWidgets);
        expect(find.text('Aura Studio'), findsOneWidget);
        expect(find.text('Velvet Nails & Spa'), findsOneWidget);
        expect(find.text('Lumina Skin Clinic'), findsOneWidget);
        expect(find.text('The Ivory Grooming'), findsOneWidget);

        // Ratings & Distances
        expect(find.text('4.9'), findsOneWidget);
        expect(find.text('1.2 km'), findsOneWidget);

        // View Salon buttons
        expect(find.text('View Salon'), findsNWidgets(4));
      },
    );

    testWidgets(
      'filters stores by typing in search bar and handles empty result',
      (tester) async {
        tester.view.physicalSize = const Size(800, 2400);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() => tester.view.resetPhysicalSize());

        await tester.pumpWidget(const MaterialApp(home: FavoriteStoresView()));
        await tester.pumpAndSettle();

        // Type "Velvet" in search
        await tester.enterText(find.byType(TextField), 'Velvet');
        await tester.pumpAndSettle();

        // Should only show Velvet Nails & Spa
        expect(find.text('Velvet Nails & Spa'), findsOneWidget);
        expect(find.text('Aura Studio'), findsNothing);

        // Search non-existent salon
        await tester.enterText(find.byType(TextField), 'NonExistentSalonXYZ');
        await tester.pumpAndSettle();

        // Should show empty view
        expect(find.byType(FavoriteStoresEmptyView), findsOneWidget);
        expect(find.text('No Matching Favorites'), findsOneWidget);

        // Tap Clear Search button
        await tester.tap(find.text('Clear Search & Filter'));
        await tester.pumpAndSettle();

        // Restored list
        expect(find.text('Aura Studio'), findsOneWidget);
        expect(find.text('Velvet Nails & Spa'), findsOneWidget);
      },
    );

    testWidgets('toggles favorite off and undoes via snackbar', (tester) async {
      tester.view.physicalSize = const Size(800, 2400);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(const MaterialApp(home: FavoriteStoresView()));
      await tester.pumpAndSettle();

      // Tap favorite heart on first card (Aura Studio)
      final heartIcons = find.byIcon(Icons.favorite);
      expect(heartIcons, findsWidgets);

      await tester.tap(heartIcons.first);
      await tester.pumpAndSettle();

      // SnackBar with Undo
      expect(find.text('Removed Aura Studio from favorites'), findsOneWidget);
      expect(find.text('Undo'), findsOneWidget);

      // Tap Undo
      await tester.tap(find.text('Undo'), warnIfMissed: false);
      await tester.pumpAndSettle();

      // Aura Studio is restored
      expect(find.text('Aura Studio'), findsOneWidget);
    });

    testWidgets('tapping View Salon navigates to StoreDetailView', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(800, 2400);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(const MaterialApp(home: FavoriteStoresView()));
      await tester.pumpAndSettle();

      final viewSalonButtons = find.text('View Salon');
      await tester.tap(viewSalonButtons.first);
      await tester.pumpAndSettle();

      // Navigated to StoreDetailView
      expect(find.byType(StoreDetailView), findsOneWidget);
    });
  });
}
