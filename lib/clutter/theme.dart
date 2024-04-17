import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final kColorSchemeLight = const ColorScheme.light().copyWith(
  primary: const Color.fromARGB(255, 23, 80, 172),
  secondary: const Color.fromARGB(255, 122, 162, 227),
  shadow: const Color.fromARGB(255, 186, 186, 186),
  onPrimary: const Color.fromARGB(255, 251, 248, 221),
  background: const Color.fromARGB(255, 251, 248, 221),
);
final kColorSchemeDark = const ColorScheme.dark().copyWith();

class CustomTheme {
  ThemeData lightTheme = ThemeData().copyWith(
    bottomAppBarTheme: const BottomAppBarTheme().copyWith(
      color: kColorSchemeLight.primary,
    ),
    cardTheme: ThemeData()
        .cardTheme
        .copyWith(elevation: 10, clipBehavior: Clip.hardEdge),
    appBarTheme: const AppBarTheme().copyWith(
      foregroundColor: kColorSchemeLight.primary,
      surfaceTintColor: Colors.white,
      backgroundColor: const Color.fromARGB(255, 251, 248, 221),
      shadowColor: kColorSchemeLight.shadow,
    ),
    scaffoldBackgroundColor: const Color.fromARGB(255, 248, 247, 236),
    colorScheme: kColorSchemeLight,
    textTheme: GoogleFonts.poppinsTextTheme().copyWith(
      titleLarge: GoogleFonts.poppins(
        fontWeight: FontWeight.bold,
        fontSize: 22,
        color: kColorSchemeLight.primary,
      ),
      titleMedium: GoogleFonts.montserrat(
        fontWeight: FontWeight.bold,
        fontSize: 18,
        color: kColorSchemeLight.primary,
      ),
      displaySmall: GoogleFonts.montserrat(
        fontSize: 16,
        color: const Color.fromARGB(255, 86, 84, 84),
      ),
      labelMedium: GoogleFonts.poppins(
        fontWeight: FontWeight.bold,
        fontSize: 16,
        color: Colors.white,
      ),
    ),
  );
}
