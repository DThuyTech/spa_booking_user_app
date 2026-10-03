import 'package:flutter/material.dart';
import '../../tokens/app_colors.dart';

/// Metadata definition for board-game artwork and core information.
class GameArtworkData {
  final String id;
  final String title;
  final String coverUrl;
  final String heroUrl;
  final String thumbnailUrl;
  final String playerCount;
  final String playTime;
  final String complexity; // e.g. "Casual", "Strategy", "Party"
  final Color accentColor;
  final String shortDescription;

  const GameArtworkData({
    required this.id,
    required this.title,
    required this.coverUrl,
    required this.heroUrl,
    required this.thumbnailUrl,
    required this.playerCount,
    required this.playTime,
    required this.complexity,
    this.accentColor = AppColors.primaryBrown,
    this.shortDescription = '',
  });
}

/// Centralized Board Ơi Game Artwork Catalog providing coherent,
/// high-resolution visual assets for all major games in the app.
abstract final class GameArtworkCatalog {
  static const Map<String, GameArtworkData> _games = {
    'catan': GameArtworkData(
      id: 'catan',
      title: 'Catan',
      coverUrl:
          'https://images.unsplash.com/photo-1610890716171-6b1bb98ffd09?w=800&auto=format&fit=crop&q=80',
      heroUrl:
          'https://images.unsplash.com/photo-1610890716171-6b1bb98ffd09?w=1200&auto=format&fit=crop&q=80',
      thumbnailUrl:
          'https://images.unsplash.com/photo-1610890716171-6b1bb98ffd09?w=300&auto=format&fit=crop&q=80',
      playerCount: '3–4 players',
      playTime: '60–120 min',
      complexity: 'Strategy',
      accentColor: Color(0xFFC8754D),
      shortDescription:
          'Trade, build, and settle the isle of Catan in this timeless masterpiece.',
    ),
    'azul': GameArtworkData(
      id: 'azul',
      title: 'Azul',
      coverUrl:
          'https://images.unsplash.com/photo-1606167668584-78701c57f13d?w=800&auto=format&fit=crop&q=80',
      heroUrl:
          'https://images.unsplash.com/photo-1606167668584-78701c57f13d?w=1200&auto=format&fit=crop&q=80',
      thumbnailUrl:
          'https://images.unsplash.com/photo-1606167668584-78701c57f13d?w=300&auto=format&fit=crop&q=80',
      playerCount: '2–4 players',
      playTime: '30–45 min',
      complexity: 'Casual Tactical',
      accentColor: Color(0xFF6B4F3A),
      shortDescription:
          'Draft vibrant Moorish tiles to embellish the royal palace walls.',
    ),
    'coup': GameArtworkData(
      id: 'coup',
      title: 'Coup & Avalon',
      coverUrl:
          'https://images.unsplash.com/photo-1563089145-599997674d42?w=800&auto=format&fit=crop&q=80',
      heroUrl:
          'https://images.unsplash.com/photo-1563089145-599997674d42?w=1200&auto=format&fit=crop&q=80',
      thumbnailUrl:
          'https://images.unsplash.com/photo-1563089145-599997674d42?w=300&auto=format&fit=crop&q=80',
      playerCount: '2–6 players',
      playTime: '15 min',
      complexity: 'Social Bluffing',
      accentColor: Color(0xFF8B4513),
      shortDescription:
          'Bluff, manipulate, and eliminate rivals in a dystopian court of intrigue.',
    ),
    'wingspan': GameArtworkData(
      id: 'wingspan',
      title: 'Wingspan',
      coverUrl:
          'https://images.unsplash.com/photo-1516541196182-6bdb0516ed27?w=800&auto=format&fit=crop&q=80',
      heroUrl:
          'https://images.unsplash.com/photo-1516541196182-6bdb0516ed27?w=1200&auto=format&fit=crop&q=80',
      thumbnailUrl:
          'https://images.unsplash.com/photo-1516541196182-6bdb0516ed27?w=300&auto=format&fit=crop&q=80',
      playerCount: '1–5 players',
      playTime: '40–70 min',
      complexity: 'Engine Building',
      accentColor: Color(0xFF5C8A67),
      shortDescription:
          'Attract majestic birds to your wildlife preserve with thoughtful engine-building.',
    ),
    'splendor': GameArtworkData(
      id: 'splendor',
      title: 'Splendor Duel',
      coverUrl:
          'https://images.unsplash.com/photo-1585504198199-20277593b94f?w=800&auto=format&fit=crop&q=80',
      heroUrl:
          'https://images.unsplash.com/photo-1585504198199-20277593b94f?w=1200&auto=format&fit=crop&q=80',
      thumbnailUrl:
          'https://images.unsplash.com/photo-1585504198199-20277593b94f?w=300&auto=format&fit=crop&q=80',
      playerCount: '2 players',
      playTime: '30 min',
      complexity: 'Tactical Duel',
      accentColor: Color(0xFFD99B43),
      shortDescription:
          'Collect gemstone chips to acquire cards and claim renaissance prestige.',
    ),
    'tickettoride': GameArtworkData(
      id: 'tickettoride',
      title: 'Ticket to Ride',
      coverUrl:
          'https://images.unsplash.com/photo-1544620347-c4fd4a3d5957?w=800&auto=format&fit=crop&q=80',
      heroUrl:
          'https://images.unsplash.com/photo-1544620347-c4fd4a3d5957?w=1200&auto=format&fit=crop&q=80',
      thumbnailUrl:
          'https://images.unsplash.com/photo-1544620347-c4fd4a3d5957?w=300&auto=format&fit=crop&q=80',
      playerCount: '2–5 players',
      playTime: '45–60 min',
      complexity: 'Casual Route',
      accentColor: Color(0xFF6B4F3A),
      shortDescription:
          'Build railway routes connecting iconic continental cities.',
    ),
    'monopoly': GameArtworkData(
      id: 'monopoly',
      title: 'Monopoly Deal',
      coverUrl:
          'https://images.unsplash.com/photo-1563245372-f21724e3856d?w=800&auto=format&fit=crop&q=80',
      heroUrl:
          'https://images.unsplash.com/photo-1563245372-f21724e3856d?w=1200&auto=format&fit=crop&q=80',
      thumbnailUrl:
          'https://images.unsplash.com/photo-1563245372-f21724e3856d?w=300&auto=format&fit=crop&q=80',
      playerCount: '2–5 players',
      playTime: '15–20 min',
      complexity: 'Fast Casual',
      accentColor: Color(0xFFB85C50),
      shortDescription:
          'Quick-fire real-estate card trade, deal-breaking, and property sets.',
    ),
  };

  /// Find artwork data by matching game name intelligently.
  static GameArtworkData? findByGameName(String gameName) {
    final normalized = gameName.toLowerCase().replaceAll(
      RegExp(r'[^a-z0-9]'),
      '',
    );
    if (normalized.isEmpty) return null;
    for (final entry in _games.entries) {
      if (normalized == entry.key || normalized.contains(entry.key)) {
        return entry.value;
      }
    }
    // Partial word checks
    if (normalized.contains('catan')) return _games['catan'];
    if (normalized.contains('azul')) return _games['azul'];
    if (normalized.contains('coup') || normalized.contains('avalon')) {
      return _games['coup'];
    }
    if (normalized.contains('wing')) return _games['wingspan'];
    if (normalized.contains('splendor')) return _games['splendor'];
    if (normalized.contains('ticket') || normalized.contains('ride')) {
      return _games['tickettoride'];
    }
    if (normalized.contains('monopoly')) return _games['monopoly'];
    return null;
  }

  /// Get list of featured games for discovery catalog.
  static List<GameArtworkData> get allGames => _games.values.toList();
}
