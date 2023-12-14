import 'package:flutter/material.dart';
import 'package:homy_desine/core/manager/style_manager.dart';
import 'package:homy_desine/core/manager/values_manager.dart';

import 'colors_manager.dart';
import 'font_manager.dart';

// ignore: non_constant_identifier_names
ThemeData themeManager() {
  return ThemeData(
    // Background Color
    scaffoldBackgroundColor: ColorManager.praymColor,
    // Text Theme
    textTheme: TextTheme(
      //headLin
      headlineSmall: getRagularStyle(
        color: ColorManager.sideColor,
        fontSize: 16, //FontSizeManager.s15,
      ),
      headlineMedium: getRagularStyle(
        color: ColorManager.white,
        fontSize: FontSizeManager.s20,
      ),
      bodyMedium: getNormalStyle(
        color: ColorManager.white,
        fontSize: FontSizeManager.s15,
      ),
      bodyLarge: const TextStyle(
        fontSize: AppSize.s20,
        color: ColorManager.black,
      ),
      bodySmall: getSeamBoldlStyle(
        color: ColorManager.sideColor,
        fontSize: 13,
      ),
      titleMedium: getBoldStyle(
        color: ColorManager.white,
        fontSize: FontSizeManager.s12,
      ),
      titleLarge: getBoldStyle(
        color: Colors.grey.shade600,
        fontSize: FontSizeManager.s15,
      ),
    ),
  );
}
// TODO : No theme in details screen line 114 ...