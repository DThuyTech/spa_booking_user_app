import 'package:flutter/material.dart';
import '../tokens/app_colors.dart';
import '../tokens/app_radius.dart';
import '../tokens/app_typography.dart';

ThemeData buildLightTheme() {
  final base = ThemeData.light(useMaterial3: true);

  return base.copyWith(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryBrown,
      onPrimary: AppColors.white,
      secondary: AppColors.accent,
      onSecondary: AppColors.white,
      surface: AppColors.surface,
      onSurface: AppColors.darkText,
      error: AppColors.error,
      onError: AppColors.white,
      outline: AppColors.border,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
      foregroundColor: AppColors.darkText,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      titleTextStyle: AppTypography.titleLarge,
    ),
    cardTheme: CardThemeData(
      color: AppColors.surface,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.borderCard,
        side: const BorderSide(color: AppColors.border, width: 1),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryBrown,
        foregroundColor: AppColors.white,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: AppRadius.borderButton,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        textStyle: AppTypography.labelLarge,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primaryBrown,
        side: const BorderSide(color: AppColors.border, width: 1.5),
        shape: const RoundedRectangleBorder(
          borderRadius: AppRadius.borderButton,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        textStyle: AppTypography.labelLarge,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surface,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      hintStyle: AppTypography.bodyMedium.copyWith(
        color: AppColors.secondaryText.withValues(alpha: 0.7),
      ),
      border: OutlineInputBorder(
        borderRadius: AppRadius.borderMd,
        borderSide: const BorderSide(color: AppColors.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: AppRadius.borderMd,
        borderSide: const BorderSide(color: AppColors.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: AppRadius.borderMd,
        borderSide: const BorderSide(color: AppColors.primaryBrown, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: AppRadius.borderMd,
        borderSide: const BorderSide(color: AppColors.error),
      ),
    ),
    textTheme: base.textTheme.copyWith(
      displayLarge: AppTypography.editorialHero.copyWith(
        color: AppColors.darkText,
      ),
      displayMedium: AppTypography.editorialTitle.copyWith(
        color: AppColors.darkText,
      ),
      titleLarge: AppTypography.titleLarge.copyWith(color: AppColors.darkText),
      titleMedium: AppTypography.titleMedium.copyWith(
        color: AppColors.darkText,
      ),
      titleSmall: AppTypography.titleSmall.copyWith(
        color: AppColors.secondaryText,
      ),
      bodyLarge: AppTypography.bodyLarge.copyWith(color: AppColors.darkText),
      bodyMedium: AppTypography.bodyMedium.copyWith(
        color: AppColors.secondaryText,
      ),
      bodySmall: AppTypography.bodySmall.copyWith(
        color: AppColors.secondaryText,
      ),
      labelLarge: AppTypography.labelLarge.copyWith(color: AppColors.darkText),
      labelSmall: AppTypography.labelSmall.copyWith(
        color: AppColors.secondaryText,
      ),
    ),
    dividerTheme: const DividerThemeData(
      color: AppColors.border,
      thickness: 1,
      space: 1,
    ),
  );
}
