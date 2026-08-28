import 'package:flutter/material.dart';
import 'colors.dart';

/// Light theme for Outlet Manager
/// Follows the strict color token system defined in colors.dart
ThemeData get lightTheme {
  // Create color scheme based on our tokens
  final colorScheme = ColorScheme.light(
    // Primary colors (Black/White)
    primary: kSecondaryColor, // Purple for interactive elements
    onPrimary: kTextLight, // White text on purple
    primaryContainer: kSecondaryLightColor, // Light purple
    onPrimaryContainer: kSecondaryColor, // Purple text on light purple
    // Secondary colors (using purple shades)
    secondary: kSecondaryColor,
    onSecondary: kTextLight,
    secondaryContainer: kSecondaryLightColor,
    onSecondaryContainer: kSecondaryColor,

    // Error colors
    error: kRedColor,
    onError: kTextLight,
    errorContainer: const Color(0xFFFFDAD6), // Light red tint
    onErrorContainer: kRedColor,

    // Background and surface
    surface: kPrimaryLightColor, // White for cards, dialogs, etc.
    onSurface: kTextDark, // Dark text on white surface
    surfaceContainerHighest: kBackground, // Off-white for elevated surfaces
    // Outline and borders
    outline: kTextMuted,
    outlineVariant: const Color(0xFFE0E0E0), // Light gray for subtle borders
  );

  return ThemeData(
    useMaterial3: true,
    colorScheme: colorScheme,
    scaffoldBackgroundColor: kBackground,

    // AppBar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: kBackground,
      foregroundColor: kTextDark,
      surfaceTintColor: Colors.transparent,
      iconTheme: const IconThemeData(color: kTextDark),
      titleTextStyle: const TextStyle(
        color: kTextDark,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),

    // Button themes — black pill primary actions, purple reserved for
    // accents/links/selection per the redesign's color system.
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: kTextDark,
        foregroundColor: kTextLight,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        shape: const StadiumBorder(),
        elevation: 0,
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: kTextDark,
        side: const BorderSide(color: kBorderColor, width: 1.5),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        shape: const StadiumBorder(),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: kSecondaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
    ),

    // FloatingActionButton theme
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: kSecondaryColor,
      foregroundColor: kTextLight,
      elevation: 4,
    ),

    // Input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: kPrimaryLightColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: kBorderColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: kBorderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: kSecondaryColor, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: kRedColor),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: kRedColor, width: 2),
      ),
      labelStyle: const TextStyle(color: kTextMuted),
      hintStyle: const TextStyle(color: kTextMuted),
      errorStyle: const TextStyle(color: kRedColor),
    ),

    // Card theme — white bordered surface, no shadow (matches the redesign's
    // flat card + hairline border look)
    cardTheme: CardThemeData(
      color: kPrimaryLightColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
        side: const BorderSide(color: kBorderColor),
      ),
    ),

    // Chip theme — pill-shaped, light-purple "selected" look by default
    chipTheme: ChipThemeData(
      backgroundColor: kSecondaryLightColor,
      labelStyle: const TextStyle(
        color: kSecondaryColor,
        fontWeight: FontWeight.w700,
      ),
      side: BorderSide.none,
      shape: const StadiumBorder(),
    ),

    // Dialog theme
    dialogTheme: DialogThemeData(
      backgroundColor: kPrimaryLightColor,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      titleTextStyle: const TextStyle(
        color: kTextDark,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),

    // Divider theme
    dividerTheme: const DividerThemeData(
      color: kTextMuted,
      thickness: 1,
      space: 1,
    ),

    // Bottom navigation bar theme
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: kPrimaryLightColor,
      selectedItemColor: kSecondaryColor,
      unselectedItemColor: kTextMuted,
      type: BottomNavigationBarType.fixed,
      elevation: 8,
    ),

    // SnackBar theme
    snackBarTheme: SnackBarThemeData(
      backgroundColor: kTextDark,
      contentTextStyle: const TextStyle(color: kTextLight),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      behavior: SnackBarBehavior.floating,
    ),

    // Icon theme
    iconTheme: const IconThemeData(color: kTextDark),

    // Text theme
    textTheme: const TextTheme(
      displayLarge: TextStyle(color: kTextDark),
      displayMedium: TextStyle(color: kTextDark),
      displaySmall: TextStyle(color: kTextDark),
      headlineLarge: TextStyle(color: kTextDark),
      headlineMedium: TextStyle(color: kTextDark),
      headlineSmall: TextStyle(color: kTextDark),
      titleLarge: TextStyle(color: kTextDark),
      titleMedium: TextStyle(color: kTextDark),
      titleSmall: TextStyle(color: kTextDark),
      bodyLarge: TextStyle(color: kTextDark),
      bodyMedium: TextStyle(color: kTextDark),
      bodySmall: TextStyle(color: kTextMuted),
      labelLarge: TextStyle(color: kTextDark),
      labelMedium: TextStyle(color: kTextMuted),
      labelSmall: TextStyle(color: kTextMuted),
    ),

    // Progress indicator
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: kSecondaryColor,
    ),

    // Switch theme
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return kSecondaryColor;
        }
        return kTextMuted;
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return kSecondaryColor.withOpacity(0.5);
        }
        return kTextMuted.withOpacity(0.3);
      }),
    ),

    // Checkbox theme
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return kSecondaryColor;
        }
        return Colors.transparent;
      }),
      checkColor: WidgetStateProperty.all(kTextLight),
    ),

    // Radio theme
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return kSecondaryColor;
        }
        return kTextMuted;
      }),
    ),
  );
}

/// Dark theme for Outlet Manager
/// Follows the strict color token system with appropriate dark mode adaptations
ThemeData get darkTheme {
  // Create dark color scheme based on our tokens
  final colorScheme = ColorScheme.dark(
    // Primary colors
    primary: kSecondaryColor, // Keep purple for interactive elements
    onPrimary: kTextLight,
    primaryContainer: const Color(0xFF3A2266), // Darker purple
    onPrimaryContainer: kSecondaryLightColor,

    // Secondary colors
    secondary: kSecondaryColor,
    onSecondary: kTextLight,
    secondaryContainer: const Color(0xFF3A2266),
    onSecondaryContainer: kSecondaryLightColor,

    // Error colors
    error: const Color(0xFFFF5449), // Lighter red for dark mode
    onError: kPrimaryColor,
    errorContainer: const Color(0xFF93000A),
    onErrorContainer: const Color(0xFFFFDAD6),

    // Background and surface
    surface: const Color(0xFF1C1C1E), // Dark gray for cards, dialogs
    onSurface: kTextLight,
    surfaceContainerHighest: const Color(
      0xFF2C2C2E,
    ), // Slightly lighter for elevation
    // Outline and borders
    outline: const Color(0xFF8E8E93),
    outlineVariant: const Color(0xFF3A3A3C),
  );

  return ThemeData(
    useMaterial3: true,
    colorScheme: colorScheme,
    scaffoldBackgroundColor: kPrimaryColor, // Black background in dark mode
    // AppBar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: const Color(0xFF1C1C1E),
      foregroundColor: kTextLight,
      surfaceTintColor: Colors.transparent,
      iconTheme: const IconThemeData(color: kTextLight),
      titleTextStyle: const TextStyle(
        color: kTextLight,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),

    // Button themes
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: kSecondaryColor,
        foregroundColor: kTextLight,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: kSecondaryColor,
        side: const BorderSide(color: kSecondaryColor, width: 1.5),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: kSecondaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
    ),

    // FloatingActionButton theme
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: kSecondaryColor,
      foregroundColor: kTextLight,
      elevation: 4,
    ),

    // Input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFF2C2C2E),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFF8E8E93)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFF8E8E93)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: kSecondaryColor, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFFF5449)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFFF5449), width: 2),
      ),
      labelStyle: const TextStyle(color: Color(0xFF8E8E93)),
      hintStyle: const TextStyle(color: Color(0xFF8E8E93)),
      errorStyle: const TextStyle(color: Color(0xFFFF5449)),
    ),

    // Card theme
    cardTheme: CardThemeData(
      color: const Color(0xFF1C1C1E),
      elevation: 1,
      shadowColor: kPrimaryColor.withOpacity(0.3),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),

    // Chip theme
    chipTheme: ChipThemeData(
      backgroundColor: const Color(0xFF3A2266),
      labelStyle: const TextStyle(color: kSecondaryLightColor),
      side: BorderSide.none,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),

    // Dialog theme
    dialogTheme: DialogThemeData(
      backgroundColor: const Color(0xFF1C1C1E),
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      titleTextStyle: const TextStyle(
        color: kTextLight,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),

    // Divider theme
    dividerTheme: const DividerThemeData(
      color: Color(0xFF3A3A3C),
      thickness: 1,
      space: 1,
    ),

    // Bottom navigation bar theme
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF1C1C1E),
      selectedItemColor: kSecondaryColor,
      unselectedItemColor: Color(0xFF8E8E93),
      type: BottomNavigationBarType.fixed,
      elevation: 8,
    ),

    // SnackBar theme
    snackBarTheme: SnackBarThemeData(
      backgroundColor: const Color(0xFF2C2C2E),
      contentTextStyle: const TextStyle(color: kTextLight),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      behavior: SnackBarBehavior.floating,
    ),

    // Icon theme
    iconTheme: const IconThemeData(color: kTextLight),

    // Text theme
    textTheme: const TextTheme(
      displayLarge: TextStyle(color: kTextLight),
      displayMedium: TextStyle(color: kTextLight),
      displaySmall: TextStyle(color: kTextLight),
      headlineLarge: TextStyle(color: kTextLight),
      headlineMedium: TextStyle(color: kTextLight),
      headlineSmall: TextStyle(color: kTextLight),
      titleLarge: TextStyle(color: kTextLight),
      titleMedium: TextStyle(color: kTextLight),
      titleSmall: TextStyle(color: kTextLight),
      bodyLarge: TextStyle(color: kTextLight),
      bodyMedium: TextStyle(color: kTextLight),
      bodySmall: TextStyle(color: Color(0xFF8E8E93)),
      labelLarge: TextStyle(color: kTextLight),
      labelMedium: TextStyle(color: Color(0xFF8E8E93)),
      labelSmall: TextStyle(color: Color(0xFF8E8E93)),
    ),

    // Progress indicator
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: kSecondaryColor,
    ),

    // Switch theme
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return kSecondaryColor;
        }
        return const Color(0xFF8E8E93);
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return kSecondaryColor.withOpacity(0.5);
        }
        return const Color(0xFF3A3A3C);
      }),
    ),

    // Checkbox theme
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return kSecondaryColor;
        }
        return Colors.transparent;
      }),
      checkColor: WidgetStateProperty.all(kTextLight),
    ),

    // Radio theme
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return kSecondaryColor;
        }
        return const Color(0xFF8E8E93);
      }),
    ),
  );
}
