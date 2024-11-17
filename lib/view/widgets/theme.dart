import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme personalizatedLight(){
    return const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF1C1C5E),
    onPrimary: Color(0xFFFFFFFF),// Contraste para texto sobre primary

    secondary: Color(0xFF30619C),
    onSecondary: Color(0xFFFFFFFF), // Contraste para texto sobre secondary

    tertiary: Color(0xFFAFE8FF),
    onTertiary: Color(0xFF1C1C1C), // Contraste para texto sobre tertiary

    error: Color(0xFFFE0000),
    onError: Color(0xFFFFFFFF), // Contraste para texto sobre error
     background: Color(0xFFFFFFFF),
     onBackground: Color(0xFF1C1C1C), // Contraste para texto sobre background
    surface: Color(0xFFE1EAF2),
    onSurface: Color(0xFF1C1C1C));
  }

  ThemeData personalizated(){
    return theme(personalizatedLight());
  }

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xFF1C1C5E),
      onPrimary: Color(0xFFFFFFFF), // Contraste para texto sobre primary
      secondary: Color(0xFF30619C),
      onSecondary: Color(0xFFFFFFFF), // Contraste para texto sobre secondary
      tertiary: Color(0xFFAFE8FF),
      onTertiary: Color(0xFF1C1C1C), // Contraste para texto sobre tertiary
      error: Color(0xFFFE0000),
      onError: Color(0xFFFFFFFF), // Contraste para texto sobre error
      background: Color(0xFFFFFFFF),
      onBackground: Color(0xFF1C1C1C), // Contraste para texto sobre background
      surface: Color(0xFFE1EAF2),
      onSurface: Color(0xFF1C1C1C),
      //primary: Color(4280444039),
      surfaceTint: Color(4280444039),
      //onPrimary: Color(4294967295),
      primaryContainer: Color(4291291135),
      onPrimaryContainer: Color(4278197806),
      //secondary: Color(4283392366),
      //onSecondary: Color(4294967295),
      secondaryContainer: Color(4292011509),
      onSecondaryContainer: Color(4278918441),
      //tertiary: Color(4284635516),
      //onTertiary: Color(4294967295),
      tertiaryContainer: Color(4293451263),
      onTertiaryContainer: Color(4280161845),
      //error: Color(4290386458),
      //onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      //background: Color(4294376190),
      //onBackground: Color(4279770144),
      //surface: Color(4294376190),
      //onSurface: Color(4279770144),
      surfaceVariant: Color(4292731882),
      onSurfaceVariant: Color(4282468429),
      outline: Color(4285626494),
      outlineVariant: Color(4290889678),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281151797),
      inverseOnSurface: Color(4293849590),
      inversePrimary: Color(4287811318),
      primaryFixed: Color(4291291135),
      onPrimaryFixed: Color(4278197806),
      primaryFixedDim: Color(4287811318),
      onPrimaryFixedVariant: Color(4278209644),
      secondaryFixed: Color(4292011509),
      onSecondaryFixed: Color(4278918441),
      secondaryFixedDim: Color(4290169304),
      onSecondaryFixedVariant: Color(4281813333),
      tertiaryFixed: Color(4293451263),
      onTertiaryFixed: Color(4280161845),
      tertiaryFixedDim: Color(4291608809),
      onTertiaryFixedVariant: Color(4283056739),
      surfaceDim: Color(4292336351),
      surfaceBright: Color(4294376190),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294046969),
      surfaceContainer: Color(4293652211),
      surfaceContainerHigh: Color(4293257453),
      surfaceContainerHighest: Color(4292862951),
    );
  }

  ThemeData light() {
    return theme(lightScheme().toColorScheme());
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

class MaterialScheme {
  const MaterialScheme({
    required this.brightness,
    required this.primary,
    required this.surfaceTint,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.surfaceVariant,
    required this.onSurfaceVariant,
    required this.outline,
    required this.outlineVariant,
    required this.shadow,
    required this.scrim,
    required this.inverseSurface,
    required this.inverseOnSurface,
    required this.inversePrimary,
    required this.primaryFixed,
    required this.onPrimaryFixed,
    required this.primaryFixedDim,
    required this.onPrimaryFixedVariant,
    required this.secondaryFixed,
    required this.onSecondaryFixed,
    required this.secondaryFixedDim,
    required this.onSecondaryFixedVariant,
    required this.tertiaryFixed,
    required this.onTertiaryFixed,
    required this.tertiaryFixedDim,
    required this.onTertiaryFixedVariant,
    required this.surfaceDim,
    required this.surfaceBright,
    required this.surfaceContainerLowest,
    required this.surfaceContainerLow,
    required this.surfaceContainer,
    required this.surfaceContainerHigh,
    required this.surfaceContainerHighest,
  });

  final Brightness brightness;
  final Color primary;
  final Color surfaceTint;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color inversePrimary;
  final Color primaryFixed;
  final Color onPrimaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color onSecondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color onTertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixedVariant;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
}

extension MaterialSchemeUtils on MaterialScheme {
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      background: background,
      onBackground: onBackground,
      surface: surface,
      onSurface: onSurface,
      surfaceVariant: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: inverseOnSurface,
      inversePrimary: inversePrimary,
    );
  }
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