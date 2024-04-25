import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';

var kcolor = ColorScheme.fromSeed(
    seedColor: Color.fromARGB(136, 1, 255, 251),);
var kDarkColor = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 5, 99, 125),  
);

void main() {
  const expense = Expenses();
  runApp(
    MaterialApp(
        darkTheme: ThemeData.dark().copyWith(
          useMaterial3: true,
          colorScheme: kDarkColor,
          cardTheme: const CardTheme().copyWith(
            color: kDarkColor.secondaryContainer,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kDarkColor.primaryContainer,
              foregroundColor: kDarkCol
              
              or.onPrimaryContainer,
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        theme: ThemeData().copyWith(
          useMaterial3: true,
          colorScheme: kcolor,
          appBarTheme: AppBarTheme(
              backgroundColor: kcolor.inversePrimary,
              foregroundColor: kcolor.primaryContainer),
          cardTheme: const CardTheme().copyWith(
            color: kcolor.secondaryContainer,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: kcolor.primaryContainer),
          ),
          textTheme: ThemeData().textTheme.copyWith(
                titleLarge: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kcolor.onSecondaryContainer,
                    fontSize: 16),
              ),
        ),
        themeMode: ThemeMode.system,
        home: expense),
    // ThemeData.dark()
  );
}
