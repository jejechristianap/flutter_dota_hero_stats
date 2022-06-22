import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dota_hero_list/common/styles/app_colors.dart';
import 'package:flutter_dota_hero_list/common/styles/app_text_styles.dart';

class AppTheme {
  static final main = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: Colors.red,
    brightness: Brightness.dark,
    canvasColor: AppColors.primary,
    // buttonTheme: ButtonThemeData(
    //   buttonColor: AppColors.primary,
    //   textTheme: ButtonTextTheme.primary,
    //   height: 54.0,
    //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(34.0)),
    // ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: AppColors.background,
        onPrimary: Colors.white,
        textStyle: AppTextStyles.heading1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(34.0),
        ),
      ),
    ),
    appBarTheme: AppBarTheme(
      color: AppColors.background,
      elevation: 0,
      iconTheme: IconThemeData(
        color: AppColors.primary,
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
        // statusBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
      centerTitle: true,
    ),
    dividerColor: Colors.grey[100],
  );
}
