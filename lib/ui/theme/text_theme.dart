import 'package:flutter/material.dart';
import 'package:online_store_application/ui/theme/color_scheme.dart';

TextTheme textTheme = TextTheme(
  titleMedium: const TextStyle(
    fontFamily: 'Mark',
    fontWeight: FontWeight.w500,
    fontSize: 15,
  ),
  titleLarge: TextStyle(
    fontFamily: 'Mark',
    fontWeight: FontWeight.w500,
    fontSize: 18,
    color: colorScheme.secondary,
  ),
  displaySmall: const TextStyle(
    fontFamily: 'Mark',
    fontWeight: FontWeight.w400,
    fontSize: 10,
  ),
  displayMedium: const TextStyle(
    fontFamily: 'Mark',
    fontWeight: FontWeight.w400,
    fontSize: 15,
  ),
  displayLarge: TextStyle(
    fontFamily: 'Mark',
    fontWeight: FontWeight.w700,
    fontSize: 25,
    color: colorScheme.secondary,
  ),
  bodyLarge: TextStyle(
    fontFamily: 'SfPro',
    fontWeight: FontWeight.w700,
    fontSize: 25,
    color: colorScheme.onPrimary,
  ),
  bodyMedium: TextStyle(
    fontFamily: 'SfPro',
    fontWeight: FontWeight.w700,
    fontSize: 11,
    color: colorScheme.onPrimary,
  ),
);
