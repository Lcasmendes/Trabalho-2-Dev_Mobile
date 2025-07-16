import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme createTextTheme(
    BuildContext? context, String bodyFontString, String displayFontString) {
  TextTheme baseTextTheme;

  if (context != null) {
    baseTextTheme = Theme.of(context).textTheme;
  } else {
    baseTextTheme = Typography.material2018().englishLike.copyWith(
      displayLarge: const TextStyle(color: Colors.black),
      displayMedium: const TextStyle(color: Colors.black),
      displaySmall: const TextStyle(color: Colors.black),
      headlineLarge: const TextStyle(color: Colors.black),
      headlineMedium: const TextStyle(color: Colors.black),
      headlineSmall: const TextStyle(color: Colors.black),
      titleLarge: const TextStyle(color: Colors.black),
      titleMedium: const TextStyle(color: Colors.black),
      titleSmall: const TextStyle(color: Colors.black),
      bodyLarge: const TextStyle(color: Colors.black),
      bodyMedium: const TextStyle(color: Colors.black),
      bodySmall: const TextStyle(color: Colors.black),
      labelLarge: const TextStyle(color: Colors.black),
      labelMedium: const TextStyle(color: Colors.black),
      labelSmall: const TextStyle(color: Colors.black),
    );
  }
  final TextTheme bodyGoogleTextTheme = GoogleFonts.getTextTheme(bodyFontString);
  final TextTheme displayGoogleTextTheme = GoogleFonts.getTextTheme(displayFontString);

  return baseTextTheme.copyWith(
    // Display styles from displayGoogleTextTheme
    displayLarge: displayGoogleTextTheme.displayLarge,
    displayMedium: displayGoogleTextTheme.displayMedium,
    displaySmall: displayGoogleTextTheme.displaySmall,
    headlineLarge: displayGoogleTextTheme.headlineLarge,
    headlineMedium: displayGoogleTextTheme.headlineMedium,
    headlineSmall: displayGoogleTextTheme.headlineSmall,
    titleLarge: displayGoogleTextTheme.titleLarge,
    titleMedium: displayGoogleTextTheme.titleMedium,
    titleSmall: displayGoogleTextTheme.titleSmall,

    // Body/Label styles from bodyGoogleTextTheme
    bodyLarge: bodyGoogleTextTheme.bodyLarge,
    bodyMedium: bodyGoogleTextTheme.bodyMedium,
    bodySmall: bodyGoogleTextTheme.bodySmall,
    labelLarge: bodyGoogleTextTheme.labelLarge,
    labelMedium: bodyGoogleTextTheme.labelMedium,
    labelSmall: bodyGoogleTextTheme.labelSmall,
  );
}