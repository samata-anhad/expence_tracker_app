import 'package:flutter/material.dart';
import 'package:expence_tracker_app/widget/expences.dart';

// Creating The Color own Color Wizard Scheme,
// So that selecting the base color once,
// others will automatically be selected according to the base color.

// Light Color Theme
var kColorScheme = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 96, 59, 181),
);

// Dark Color Theme
var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: Color.fromARGB(255, 5, 99, 125),
);

void main() {
  runApp(
    MaterialApp(
      // =========================
      // DARK THEME
      // =========================
      darkTheme: ThemeData().copyWith(
        colorScheme: kDarkColorScheme,

        // TextField / TextFormField styling
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(
            color: kDarkColorScheme.onSurface,
          ),
          hintStyle: TextStyle(
            color: kDarkColorScheme.onSurface.withValues(alpha: 0.7),
          ),
        ),

        cardTheme: CardThemeData().copyWith(
          color: kDarkColorScheme.onSecondaryContainer,
          margin: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 20,
          ),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.onPrimaryContainer,
            foregroundColor: kDarkColorScheme.primaryContainer,
          ),
        ),
      ),

      // =========================
      // LIGHT THEME
      // =========================
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,

        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),

        cardTheme: CardThemeData().copyWith(
          color: kColorScheme.onSecondaryContainer,
          margin: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 20,
          ),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
          ),
        ),

        textTheme: TextTheme().copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.normal,
            color: const Color.fromARGB(255, 255, 248, 253),
            fontSize: 14,
          ),
        ),
      ),

      // Starting screen
      home: const Expenses(),
      debugShowCheckedModeBanner: false,
    ),
  );
}