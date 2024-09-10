import 'package:flutter/material.dart';
import '../app_colors/appColors.dart';

class AppTextStyles {
  // Headline styles
  static TextStyle headline1 = TextStyle(
    fontSize: 32.0,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimaryColor,
  );

  static TextStyle headline2 = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimaryColor,
  );

  static TextStyle headline3 = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimaryColor,
  );

  // Body text styles
  static TextStyle bodyText1 = TextStyle(
    fontSize: 16.0,
    color: AppColors.textPrimaryColor,
  );

  static TextStyle bodyText2 = TextStyle(
    fontSize: 14.0,
    color: AppColors.textSecondaryColor,
  );

  // Caption styles
  static TextStyle caption = TextStyle(
    fontSize: 12.0,
    color: AppColors.textHintColor,
  );

  // Button text styles
  static TextStyle button = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    color: AppColors.cardColor,
  );

  // Error text style
  static TextStyle errorText = TextStyle(
    fontSize: 14.0,
    color: AppColors.errorColor,
  );

  // Success text style
  static TextStyle successText = TextStyle(
    fontSize: 14.0,
    color: AppColors.successColor,
  );

  // Warning text style
  static TextStyle warningText = TextStyle(
    fontSize: 14.0,
    color: AppColors.warningColor,
  );

  // Info text style
  static TextStyle infoText = TextStyle(
    fontSize: 14.0,
    color: AppColors.infoColor,
  );
}
