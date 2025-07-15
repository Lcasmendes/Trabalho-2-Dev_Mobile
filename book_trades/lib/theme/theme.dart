import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff904b3b),
      surfaceTint: Color(0xff904b3b),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffffdad2),
      onPrimaryContainer: Color(0xff723425),
      secondary: Color(0xff77574f),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffffdad2),
      onSecondaryContainer: Color(0xff5d3f38),
      tertiary: Color(0xff6d5d2e),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xfff7e1a6),
      onTertiaryContainer: Color(0xff544519),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfffff8f6),
      onSurface: Color(0xff231917),
      onSurfaceVariant: Color(0xff534340),
      outline: Color(0xff85736f),
      outlineVariant: Color(0xffd8c2bd),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff392e2c),
      inversePrimary: Color(0xffffb4a3),
      primaryFixed: Color(0xffffdad2),
      onPrimaryFixed: Color(0xff3a0a02),
      primaryFixedDim: Color(0xffffb4a3),
      onPrimaryFixedVariant: Color(0xff723425),
      secondaryFixed: Color(0xffffdad2),
      onSecondaryFixed: Color(0xff2c1510),
      secondaryFixedDim: Color(0xffe7bdb3),
      onSecondaryFixedVariant: Color(0xff5d3f38),
      tertiaryFixed: Color(0xfff7e1a6),
      onTertiaryFixed: Color(0xff241a00),
      tertiaryFixedDim: Color(0xffdac58c),
      onTertiaryFixedVariant: Color(0xff544519),
      surfaceDim: Color(0xffe8d6d2),
      surfaceBright: Color(0xfffff8f6),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff0ed),
      surfaceContainer: Color(0xfffceae6),
      surfaceContainerHigh: Color(0xfff7e4e0),
      surfaceContainerHighest: Color(0xfff1dfdb),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff5d2417),
      surfaceTint: Color(0xff904b3b),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffa15948),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff4b2f29),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff87655d),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff423509),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff7c6c3b),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f6),
      onSurface: Color(0xff180f0d),
      onSurfaceVariant: Color(0xff413330),
      outline: Color(0xff5f4f4b),
      outlineVariant: Color(0xff7b6965),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff392e2c),
      inversePrimary: Color(0xffffb4a3),
      primaryFixed: Color(0xffa15948),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff844232),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff87655d),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff6d4d46),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff7c6c3b),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff635326),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd4c3bf),
      surfaceBright: Color(0xfffff8f6),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff0ed),
      surfaceContainer: Color(0xfff7e4e0),
      surfaceContainerHigh: Color(0xffebd9d5),
      surfaceContainerHighest: Color(0xffdfceca),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff501b0e),
      surfaceTint: Color(0xff904b3b),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff753728),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff3f251f),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff60423b),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff372b02),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff56481b),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f6),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff372926),
      outlineVariant: Color(0xff554642),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff392e2c),
      inversePrimary: Color(0xffffb4a3),
      primaryFixed: Color(0xff753728),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff592114),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff60423b),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff472c25),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff56481b),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff3e3106),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc6b5b1),
      surfaceBright: Color(0xfffff8f6),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffffede9),
      surfaceContainer: Color(0xfff1dfdb),
      surfaceContainerHigh: Color(0xffe2d1cd),
      surfaceContainerHighest: Color(0xffd4c3bf),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffb4a3),
      surfaceTint: Color(0xffffb4a3),
      onPrimary: Color(0xff561f12),
      primaryContainer: Color(0xff723425),
      onPrimaryContainer: Color(0xffffdad2),
      secondary: Color(0xffe7bdb3),
      onSecondary: Color(0xff442a23),
      secondaryContainer: Color(0xff5d3f38),
      onSecondaryContainer: Color(0xffffdad2),
      tertiary: Color(0xffdac58c),
      onTertiary: Color(0xff3c2f04),
      tertiaryContainer: Color(0xff544519),
      onTertiaryContainer: Color(0xfff7e1a6),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff1a110f),
      onSurface: Color(0xfff1dfdb),
      onSurfaceVariant: Color(0xffd8c2bd),
      outline: Color(0xffa08c88),
      outlineVariant: Color(0xff534340),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff1dfdb),
      inversePrimary: Color(0xff904b3b),
      primaryFixed: Color(0xffffdad2),
      onPrimaryFixed: Color(0xff3a0a02),
      primaryFixedDim: Color(0xffffb4a3),
      onPrimaryFixedVariant: Color(0xff723425),
      secondaryFixed: Color(0xffffdad2),
      onSecondaryFixed: Color(0xff2c1510),
      secondaryFixedDim: Color(0xffe7bdb3),
      onSecondaryFixedVariant: Color(0xff5d3f38),
      tertiaryFixed: Color(0xfff7e1a6),
      onTertiaryFixed: Color(0xff241a00),
      tertiaryFixedDim: Color(0xffdac58c),
      onTertiaryFixedVariant: Color(0xff544519),
      surfaceDim: Color(0xff1a110f),
      surfaceBright: Color(0xff423734),
      surfaceContainerLowest: Color(0xff140c0a),
      surfaceContainerLow: Color(0xff231917),
      surfaceContainer: Color(0xff271d1b),
      surfaceContainerHigh: Color(0xff322825),
      surfaceContainerHighest: Color(0xff3d3230),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffd2c8),
      surfaceTint: Color(0xffffb4a3),
      onPrimary: Color(0xff481408),
      primaryContainer: Color(0xffcb7c68),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffed3c8),
      onSecondary: Color(0xff381f19),
      secondaryContainer: Color(0xffae887f),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfff1dba0),
      onTertiary: Color(0xff302400),
      tertiaryContainer: Color(0xffa28f5c),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff1a110f),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffeed7d2),
      outline: Color(0xffc2ada8),
      outlineVariant: Color(0xffa08c88),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff1dfdb),
      inversePrimary: Color(0xff743626),
      primaryFixed: Color(0xffffdad2),
      onPrimaryFixed: Color(0xff2a0300),
      primaryFixedDim: Color(0xffffb4a3),
      onPrimaryFixedVariant: Color(0xff5d2417),
      secondaryFixed: Color(0xffffdad2),
      onSecondaryFixed: Color(0xff200b07),
      secondaryFixedDim: Color(0xffe7bdb3),
      onSecondaryFixedVariant: Color(0xff4b2f29),
      tertiaryFixed: Color(0xfff7e1a6),
      onTertiaryFixed: Color(0xff171000),
      tertiaryFixedDim: Color(0xffdac58c),
      onTertiaryFixedVariant: Color(0xff423509),
      surfaceDim: Color(0xff1a110f),
      surfaceBright: Color(0xff4e423f),
      surfaceContainerLowest: Color(0xff0d0605),
      surfaceContainerLow: Color(0xff251b19),
      surfaceContainer: Color(0xff302623),
      surfaceContainerHigh: Color(0xff3b302e),
      surfaceContainerHighest: Color(0xff463b38),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffece8),
      surfaceTint: Color(0xffffb4a3),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffffaf9c),
      onPrimaryContainer: Color(0xff1f0200),
      secondary: Color(0xffffece8),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffe3b9af),
      onSecondaryContainer: Color(0xff190603),
      tertiary: Color(0xffffefc9),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffd6c189),
      onTertiaryContainer: Color(0xff100b00),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff1a110f),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffffece8),
      outlineVariant: Color(0xffd4beb9),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff1dfdb),
      inversePrimary: Color(0xff743626),
      primaryFixed: Color(0xffffdad2),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffffb4a3),
      onPrimaryFixedVariant: Color(0xff2a0300),
      secondaryFixed: Color(0xffffdad2),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffe7bdb3),
      onSecondaryFixedVariant: Color(0xff200b07),
      tertiaryFixed: Color(0xfff7e1a6),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffdac58c),
      onTertiaryFixedVariant: Color(0xff171000),
      surfaceDim: Color(0xff1a110f),
      surfaceBright: Color(0xff5a4d4b),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff271d1b),
      surfaceContainer: Color(0xff392e2c),
      surfaceContainerHigh: Color(0xff443936),
      surfaceContainerHighest: Color(0xff504441),
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

  /// Custom Color 1
  static const customColor1 = ExtendedColor(
    seed: Color(0xff23a520),
    value: Color(0xff23a520),
    light: ColorFamily(
      color: Color(0xff3f6836),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xffc0efb0),
      onColorContainer: Color(0xff285021),
    ),
    lightMediumContrast: ColorFamily(
      color: Color(0xff3f6836),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xffc0efb0),
      onColorContainer: Color(0xff285021),
    ),
    lightHighContrast: ColorFamily(
      color: Color(0xff3f6836),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xffc0efb0),
      onColorContainer: Color(0xff285021),
    ),
    dark: ColorFamily(
      color: Color(0xffa4d396),
      onColor: Color(0xff10380c),
      colorContainer: Color(0xff285021),
      onColorContainer: Color(0xffc0efb0),
    ),
    darkMediumContrast: ColorFamily(
      color: Color(0xffa4d396),
      onColor: Color(0xff10380c),
      colorContainer: Color(0xff285021),
      onColorContainer: Color(0xffc0efb0),
    ),
    darkHighContrast: ColorFamily(
      color: Color(0xffa4d396),
      onColor: Color(0xff10380c),
      colorContainer: Color(0xff285021),
      onColorContainer: Color(0xffc0efb0),
    ),
  );


  List<ExtendedColor> get extendedColors => [
    customColor1,
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
