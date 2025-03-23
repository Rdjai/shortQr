import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff046e00),
      surfaceTint: Color(0xff046e00),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff09c300),
      onPrimaryContainer: Color(0xff024800),
      secondary: Color(0xff196d0f),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffa0f88a),
      onSecondaryContainer: Color(0xff217416),
      tertiary: Color(0xff006972),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff00b9c9),
      onTertiaryContainer: Color(0xff00444a),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfff2fde9),
      onSurface: Color(0xff151e12),
      onSurfaceVariant: Color(0xff3d4b37),
      outline: Color(0xff6d7b66),
      outlineVariant: Color(0xffbccbb2),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2a3326),
      inversePrimary: Color(0xff43e431),
      primaryFixed: Color(0xff77ff60),
      onPrimaryFixed: Color(0xff002200),
      primaryFixedDim: Color(0xff43e431),
      onPrimaryFixedVariant: Color(0xff025300),
      secondaryFixed: Color(0xffa0f88a),
      onSecondaryFixed: Color(0xff002200),
      secondaryFixedDim: Color(0xff85db71),
      onSecondaryFixedVariant: Color(0xff025300),
      tertiaryFixed: Color(0xff8ef2ff),
      onTertiaryFixed: Color(0xff001f23),
      tertiaryFixedDim: Color(0xff48d9e9),
      onTertiaryFixedVariant: Color(0xff004f56),
      surfaceDim: Color(0xffd3ddcb),
      surfaceBright: Color(0xfff2fde9),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffedf7e4),
      surfaceContainer: Color(0xffe7f1de),
      surfaceContainerHigh: Color(0xffe1ebd8),
      surfaceContainerHighest: Color(0xffdbe6d3),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff014000),
      surfaceTint: Color(0xff046e00),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff057f00),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff014000),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff2b7d1f),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff003d43),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff007984),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff2fde9),
      onSurface: Color(0xff0b1308),
      onSurfaceVariant: Color(0xff2d3a28),
      outline: Color(0xff485643),
      outlineVariant: Color(0xff63715c),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2a3326),
      inversePrimary: Color(0xff43e431),
      primaryFixed: Color(0xff057f00),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff036300),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff2b7d1f),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff086303),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff007984),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff005e67),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffbfcab7),
      surfaceBright: Color(0xfff2fde9),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffedf7e4),
      surfaceContainer: Color(0xffe1ebd8),
      surfaceContainerHigh: Color(0xffd6e0cd),
      surfaceContainerHighest: Color(0xffcbd5c2),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff013500),
      surfaceTint: Color(0xff046e00),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff025600),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff013500),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff025600),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff003237),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff005159),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff2fde9),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff23301e),
      outlineVariant: Color(0xff3f4d3a),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2a3326),
      inversePrimary: Color(0xff43e431),
      primaryFixed: Color(0xff025600),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff013c00),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff025600),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff013c00),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff005159),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff00393e),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffb2bcaa),
      surfaceBright: Color(0xfff2fde9),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeaf4e1),
      surfaceContainer: Color(0xffdbe6d3),
      surfaceContainerHigh: Color(0xffcdd8c5),
      surfaceContainerHighest: Color(0xffbfcab7),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff43e431),
      surfaceTint: Color(0xff43e431),
      onPrimary: Color(0xff013a00),
      primaryContainer: Color(0xff09c300),
      onPrimaryContainer: Color(0xff024800),
      secondary: Color(0xff85db71),
      onSecondary: Color(0xff013a00),
      secondaryContainer: Color(0xff036100),
      onSecondaryContainer: Color(0xff85da71),
      tertiary: Color(0xff48d9e9),
      onTertiary: Color(0xff00363c),
      tertiaryContainer: Color(0xff00b9c9),
      onTertiaryContainer: Color(0xff00444a),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff0d160a),
      onSurface: Color(0xffdbe6d3),
      onSurfaceVariant: Color(0xffbccbb2),
      outline: Color(0xff86957e),
      outlineVariant: Color(0xff3d4b37),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdbe6d3),
      inversePrimary: Color(0xff046e00),
      primaryFixed: Color(0xff77ff60),
      onPrimaryFixed: Color(0xff002200),
      primaryFixedDim: Color(0xff43e431),
      onPrimaryFixedVariant: Color(0xff025300),
      secondaryFixed: Color(0xffa0f88a),
      onSecondaryFixed: Color(0xff002200),
      secondaryFixedDim: Color(0xff85db71),
      onSecondaryFixedVariant: Color(0xff025300),
      tertiaryFixed: Color(0xff8ef2ff),
      onTertiaryFixed: Color(0xff001f23),
      tertiaryFixedDim: Color(0xff48d9e9),
      onTertiaryFixedVariant: Color(0xff004f56),
      surfaceDim: Color(0xff0d160a),
      surfaceBright: Color(0xff333c2e),
      surfaceContainerLowest: Color(0xff081006),
      surfaceContainerLow: Color(0xff151e12),
      surfaceContainer: Color(0xff192216),
      surfaceContainerHigh: Color(0xff242c20),
      surfaceContainerHighest: Color(0xff2e372a),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff5dfb48),
      surfaceTint: Color(0xff43e431),
      onPrimary: Color(0xff012d00),
      primaryContainer: Color(0xff09c300),
      onPrimaryContainer: Color(0xff012400),
      secondary: Color(0xff9af185),
      onSecondary: Color(0xff012d00),
      secondaryContainer: Color(0xff51a341),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xff68efff),
      onTertiary: Color(0xff002b2f),
      tertiaryContainer: Color(0xff00b9c9),
      onTertiaryContainer: Color(0xff002125),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff0d160a),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffd1e1c7),
      outline: Color(0xffa7b79e),
      outlineVariant: Color(0xff86957e),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdbe6d3),
      inversePrimary: Color(0xff025500),
      primaryFixed: Color(0xff77ff60),
      onPrimaryFixed: Color(0xff001600),
      primaryFixedDim: Color(0xff43e431),
      onPrimaryFixedVariant: Color(0xff014000),
      secondaryFixed: Color(0xffa0f88a),
      onSecondaryFixed: Color(0xff001600),
      secondaryFixedDim: Color(0xff85db71),
      onSecondaryFixedVariant: Color(0xff014000),
      tertiaryFixed: Color(0xff8ef2ff),
      onTertiaryFixed: Color(0xff001417),
      tertiaryFixedDim: Color(0xff48d9e9),
      onTertiaryFixedVariant: Color(0xff003d43),
      surfaceDim: Color(0xff0d160a),
      surfaceBright: Color(0xff3e4739),
      surfaceContainerLowest: Color(0xff030902),
      surfaceContainerLow: Color(0xff172014),
      surfaceContainer: Color(0xff212a1e),
      surfaceContainerHigh: Color(0xff2c3528),
      surfaceContainerHighest: Color(0xff374033),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffc7ffb4),
      surfaceTint: Color(0xff43e431),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xff3edf2d),
      onPrimaryContainer: Color(0xff000f00),
      secondary: Color(0xffc7ffb4),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xff82d76d),
      onSecondaryContainer: Color(0xff000f00),
      tertiary: Color(0xffc9f8ff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xff43d5e5),
      onTertiaryContainer: Color(0xff000e10),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff0d160a),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffe5f5da),
      outlineVariant: Color(0xffb8c7ae),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdbe6d3),
      inversePrimary: Color(0xff025500),
      primaryFixed: Color(0xff77ff60),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xff43e431),
      onPrimaryFixedVariant: Color(0xff001600),
      secondaryFixed: Color(0xffa0f88a),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xff85db71),
      onSecondaryFixedVariant: Color(0xff001600),
      tertiaryFixed: Color(0xff8ef2ff),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xff48d9e9),
      onTertiaryFixedVariant: Color(0xff001417),
      surfaceDim: Color(0xff0d160a),
      surfaceBright: Color(0xff495344),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff192216),
      surfaceContainer: Color(0xff2a3326),
      surfaceContainerHigh: Color(0xff353e31),
      surfaceContainerHighest: Color(0xff40493c),
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

  List<ExtendedColor> get extendedColors => [];
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
