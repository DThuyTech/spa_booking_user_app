import 'package:flutter_test/flutter_test.dart';
import 'package:board_oi/src/shared/design_system/components/games/game_artwork_catalog.dart';

void main() {
  group('GameArtworkCatalog', () {
    test('contains official games in catalog', () {
      expect(GameArtworkCatalog.allGames.length, greaterThanOrEqualTo(7));
      final names = GameArtworkCatalog.allGames.map((g) => g.title).toList();
      expect(names, contains('Catan'));
      expect(names, contains('Wingspan'));
      expect(names, contains('Azul'));
      expect(names, contains('Coup & Avalon'));
      expect(names, contains('Splendor Duel'));
      expect(names, contains('Ticket to Ride'));
      expect(names, contains('Monopoly Deal'));
    });

    test('fuzzy resolves game names with casing and extra words', () {
      expect(GameArtworkCatalog.findByGameName('catan')?.title, 'Catan');
      expect(
        GameArtworkCatalog.findByGameName('Settlers of Catan')?.title,
        'Catan',
      );
      expect(
        GameArtworkCatalog.findByGameName('wingspan birds')?.title,
        'Wingspan',
      );
      expect(GameArtworkCatalog.findByGameName('AZUL')?.title, 'Azul');
      expect(
        GameArtworkCatalog.findByGameName('coup resistance')?.title,
        'Coup & Avalon',
      );
      expect(
        GameArtworkCatalog.findByGameName('Splendor Marvel')?.title,
        'Splendor Duel',
      );
      expect(
        GameArtworkCatalog.findByGameName('Ticket to Ride Europe')?.title,
        'Ticket to Ride',
      );
    });

    test('returns null for unknown games to allow clean fallback', () {
      expect(
        GameArtworkCatalog.findByGameName('TotallyUnknownGame123'),
        isNull,
      );
      expect(GameArtworkCatalog.findByGameName(''), isNull);
    });

    test('resolves metadata for matched games', () {
      final catan = GameArtworkCatalog.findByGameName('Catan');
      expect(catan, isNotNull);
      expect(catan!.coverUrl, contains('unsplash'));
      expect(catan.heroUrl, contains('unsplash'));
      expect(catan.thumbnailUrl, contains('unsplash'));
      expect(catan.playerCount, contains('players'));
      expect(catan.playTime, contains('min'));
    });
  });
}
