import 'package:estilizacao_componentes/themes/theme_colors.dart';
import 'package:flutter/material.dart';


ThemeData purpleTheme = ThemeData(
  primaryColor: ThemeColors.primary,
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: ThemeColors.primary,
    brightness: Brightness.dark,
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(fontSize: 16),
    bodyLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
  ),
  fontFamily: 'Raleway',
);
