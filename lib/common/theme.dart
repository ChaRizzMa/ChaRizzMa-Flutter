import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colorSchemes.g.dart';

ThemeData mainTheme = ThemeData(
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(),
      contentPadding:
          EdgeInsets.only(top: 4.0, bottom: 4.0, left: 16.0, right: 16.0),
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.notoSans(
          fontSize: 96,
          fontWeight: FontWeight.w600,
          letterSpacing: -1.5,
          color: lightColorScheme.onSurface),
      displayMedium: GoogleFonts.notoSans(
          fontSize: 60,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.5,
          color: lightColorScheme.onSurface),
      displaySmall: GoogleFonts.notoSans(
          fontSize: 48,
          fontWeight: FontWeight.w600,
          color: lightColorScheme.onSurface),
      headlineMedium: GoogleFonts.notoSans(
          fontSize: 34, fontWeight: FontWeight.w400, letterSpacing: 0.25),
      headlineSmall:
          GoogleFonts.notoSans(fontSize: 24, fontWeight: FontWeight.w400),
      titleLarge: GoogleFonts.notoSans(
          fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15),
      titleMedium: GoogleFonts.notoSans(
          fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
      titleSmall: GoogleFonts.notoSans(
          fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
      bodyLarge: GoogleFonts.notoSans(
          fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
      bodyMedium: GoogleFonts.notoSans(
          fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
      bodySmall: GoogleFonts.notoSans(
          fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
      labelLarge: GoogleFonts.notoSans(
          fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
      labelMedium: GoogleFonts.notoSans(
          fontSize: 12, fontWeight: FontWeight.w500, letterSpacing: 1.25),
      labelSmall: GoogleFonts.notoSans(
          fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
    ),
    colorScheme: lightColorScheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            side: MaterialStateBorderSide.resolveWith((states) {
              return const BorderSide(width: 1.0, color: Colors.black);
            }),
            shadowColor: MaterialStateProperty.all(Colors.transparent))),
    appBarTheme: AppBarTheme(
        shadowColor: Colors.transparent,
        backgroundColor: lightColorScheme.background,
        titleTextStyle: TextStyle(
            color: lightColorScheme.onSurface,
            fontSize: 24,
            fontWeight: FontWeight.bold),
        iconTheme: IconThemeData(color: lightColorScheme.onSurface),
        actionsIconTheme: IconThemeData(color: lightColorScheme.onSurface),
        shape: Border(
            bottom: BorderSide(color: lightColorScheme.onSurface, width: 1))),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: lightColorScheme.background,
    ),
    tabBarTheme: TabBarTheme(
        unselectedLabelColor: lightColorScheme.onSurface,
        labelColor: lightColorScheme.primary,
        labelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
        indicator: const BoxDecoration()));

ThemeData darkTheme = ThemeData(colorScheme: darkColorScheme);

AppBarTheme appBarThemeDark = const AppBarTheme();
