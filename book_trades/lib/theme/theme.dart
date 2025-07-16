import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff633f00),
      surfaceTint: Color(0xff825500),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff825500),
      onPrimaryContainer: Color(0xffffd194),
      secondary: Color(0xff735a38),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xfffddaaf),
      onSecondaryContainer: Color(0xff775e3c),
      tertiary: Color(0xff3f4c00),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff566418),
      onTertiaryContainer: Color(0xffcfe086),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfffff8f4),
      onSurface: Color(0xff201b15),
      onSurfaceVariant: Color(0xff504537),
      outline: Color(0xff827565),
      outlineVariant: Color(0xffd4c4b2),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff352f29),
      inversePrimary: Color(0xff825500),
      primaryFixed: Color(0xffffddb3),
      onPrimaryFixed: Color(0xff291800),
      primaryFixedDim: Color(0xfff8bc65),
      onPrimaryFixedVariant: Color(0xff633f00),
      secondaryFixed: Color(0xffffddb3),
      onSecondaryFixed: Color(0xff291800),
      secondaryFixedDim: Color(0xffe2c198),
      onSecondaryFixedVariant: Color(0xff594323),
      tertiaryFixed: Color(0xffdaeb90),
      onTertiaryFixed: Color(0xff181e00),
      tertiaryFixedDim: Color(0xffbecf77),
      onTertiaryFixedVariant: Color(0xff3f4c00),
      surfaceDim: Color(0xffe3d8ce),
      surfaceBright: Color(0xfffff8f4),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffdf2e7),
      surfaceContainer: Color(0xfff7ece2),
      surfaceContainerHigh: Color(0xfff1e6dc),
      surfaceContainerHighest: Color(0xffece1d7),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff4d3000),
      surfaceTint: Color(0xff825500),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff825500),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff473214),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff836946),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff303a00),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff566418),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f4),
      onSurface: Color(0xff15100b),
      onSurfaceVariant: Color(0xff3f3428),
      outline: Color(0xff5c5142),
      outlineVariant: Color(0xff786b5c),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff352f29),
      inversePrimary: Color(0xff825500),
      primaryFixed: Color(0xff936313),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff754c00),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff836946),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff685130),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff657326),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff4d5b0e),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffcfc5bb),
      surfaceBright: Color(0xfffff8f4),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffdf2e7),
      surfaceContainer: Color(0xfff1e6dc),
      surfaceContainerHigh: Color(0xffe6dbd1),
      surfaceContainerHighest: Color(0xffdad0c6),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff3f2700),
      surfaceTint: Color(0xff825500),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff664200),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff3c280b),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff5c4525),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff273000),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff414f01),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f4),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff342b1e),
      outlineVariant: Color(0xff53473a),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff352f29),
      inversePrimary: Color(0xff664200),
      primaryFixed: Color(0xff664200),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff482d00),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff5c4525),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff432f11),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff414f01),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff2d3700),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc1b7ae),
      surfaceBright: Color(0xfffff8f4),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffaefe5),
      surfaceContainer: Color(0xffece1d7),
      surfaceContainerHigh: Color(0xffddd3c9),
      surfaceContainerHighest: Color(0xffcfc5bb),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfff8bc65),
      surfaceTint: Color(0xfff8bc65),
      onPrimary: Color(0xff452b00),
      primaryContainer: Color(0xff825500),
      onPrimaryContainer: Color(0xffffd194),
      secondary: Color(0xffe2c198),
      onSecondary: Color(0xff402d0f),
      secondaryContainer: Color(0xff594323),
      onSecondaryContainer: Color(0xffd0b088),
      tertiary: Color(0xffbecf77),
      onTertiary: Color(0xff2b3400),
      tertiaryContainer: Color(0xff566418),
      onTertiaryContainer: Color(0xffcfe086),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff17130d),
      onSurface: Color(0xffece1d7),
      onSurfaceVariant: Color(0xffd4c4b2),
      outline: Color(0xff9d8e7e),
      outlineVariant: Color(0xff504537),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffece1d7),
      inversePrimary: Color(0xff825500),
      primaryFixed: Color(0xffffddb3),
      onPrimaryFixed: Color(0xff291800),
      primaryFixedDim: Color(0xfff8bc65),
      onPrimaryFixedVariant: Color(0xff633f00),
      secondaryFixed: Color(0xffffddb3),
      onSecondaryFixed: Color(0xff291800),
      secondaryFixedDim: Color(0xffe2c198),
      onSecondaryFixedVariant: Color(0xff594323),
      tertiaryFixed: Color(0xffdaeb90),
      onTertiaryFixed: Color(0xff181e00),
      tertiaryFixedDim: Color(0xffbecf77),
      onTertiaryFixedVariant: Color(0xff3f4c00),
      surfaceDim: Color(0xff17130d),
      surfaceBright: Color(0xff3e3831),
      surfaceContainerLowest: Color(0xff120d08),
      surfaceContainerLow: Color(0xff201b15),
      surfaceContainer: Color(0xff241f19),
      surfaceContainerHigh: Color(0xff2f2923),
      surfaceContainerHighest: Color(0xff3a342d),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffd6a0),
      surfaceTint: Color(0xfff8bc65),
      onPrimary: Color(0xff372100),
      primaryContainer: Color(0xffbc8735),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfff9d7ac),
      onSecondary: Color(0xff342206),
      secondaryContainer: Color(0xffa98c66),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffd3e58a),
      onTertiary: Color(0xff212900),
      tertiaryContainer: Color(0xff889847),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff17130d),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffebdac7),
      outline: Color(0xffbfaf9e),
      outlineVariant: Color(0xff9c8e7e),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffece1d7),
      inversePrimary: Color(0xffbc8735),
      primaryFixed: Color(0xffffddb3),
      onPrimaryFixed: Color(0xff1b0e00),
      primaryFixedDim: Color(0xfff8bc65),
      onPrimaryFixedVariant: Color(0xff4d3000),
      secondaryFixed: Color(0xffffddb3),
      onSecondaryFixed: Color(0xff1b0e00),
      secondaryFixedDim: Color(0xffe2c198),
      onSecondaryFixedVariant: Color(0xff473214),
      tertiaryFixed: Color(0xffdaeb90),
      onTertiaryFixed: Color(0xff0e1300),
      tertiaryFixedDim: Color(0xffbecf77),
      onTertiaryFixedVariant: Color(0xff303a00),
      surfaceDim: Color(0xff17130d),
      surfaceBright: Color(0xff4a433c),
      surfaceContainerLowest: Color(0xff0a0703),
      surfaceContainerLow: Color(0xff221d17),
      surfaceContainer: Color(0xff2c2721),
      surfaceContainerHigh: Color(0xff37322b),
      surfaceContainerHighest: Color(0xff433d36),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffedda),
      surfaceTint: Color(0xfff8bc65),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xfff4b861),
      onPrimaryContainer: Color(0xff130900),
      secondary: Color(0xffffedda),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffdebd94),
      onSecondaryContainer: Color(0xff130900),
      tertiary: Color(0xffe7f99c),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffbacb73),
      onTertiaryContainer: Color(0xff090d00),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff17130d),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffffedda),
      outlineVariant: Color(0xffd0c0ae),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffece1d7),
      inversePrimary: Color(0xfff4b861),
      primaryFixed: Color(0xffffddb3),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xfff8bc65),
      onPrimaryFixedVariant: Color(0xff1b0e00),
      secondaryFixed: Color(0xffffddb3),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffe2c198),
      onSecondaryFixedVariant: Color(0xff1b0e00),
      tertiaryFixed: Color(0xffdaeb90),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffbecf77),
      onTertiaryFixedVariant: Color(0xff0e1300),
      surfaceDim: Color(0xff17130d),
      surfaceBright: Color(0xff564f47),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff241f19),
      surfaceContainer: Color(0xff352f29),
      surfaceContainerHigh: Color(0xff413a33),
      surfaceContainerHighest: Color(0xff4c463e),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    textTheme: textTheme.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    ),
    scaffoldBackgroundColor: colorScheme.background,
    canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
