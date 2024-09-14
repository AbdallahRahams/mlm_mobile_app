import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  // Headings
  static const TextStyle heading1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.text,
    fontFamily: 'open-sans',
  );

  static const TextStyle heading2 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.text,
    fontFamily: 'open-sans',
  );

  static const TextStyle heading21 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 255, 255, 255),
    fontFamily: 'open-sans',
  );

  static const TextStyle heading3 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.text,
    fontFamily: 'open-sans',
  );

  // Subheadings
  static const TextStyle subheading1 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.text,
    fontFamily: 'open-sans',
  );

  static const TextStyle subheading2 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.text,
    fontFamily: 'open-sans',
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: AppColors.secondary,
    fontFamily: 'open-sans',
  );

  // Body Text
  static const TextStyle bodyText1 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.text,
    fontFamily: 'open-sans',
  );

  static const TextStyle bodyText2 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.text,
    fontFamily: 'open-sans',
  );

  // Captions
  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: Colors.black54,
    fontFamily: 'open-sans',
  );

  // Button Text
  static const TextStyle button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontFamily: 'open-sans',
  );

  // Headline Text
  static const TextStyle headline = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
    fontFamily: 'open-sans',
  );

  // Links
  static const TextStyle link = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.accent,
    fontFamily: 'open-sans',
  );
}