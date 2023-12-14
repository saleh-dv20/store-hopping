import 'package:flutter/material.dart';
import 'package:homy_desine/core/manager/colors_manager.dart';
import 'package:homy_desine/core/manager/values_manager.dart';

TextFormField textFieldWidget(
  TextInputType? textInputType, {
  required String labelText,
  required String? Function(String?)? validator,
  required TextEditingController? controller,
  Widget? icon,
  bool obscureText = false,
}) {
  return TextFormField(
    controller: controller,
    validator: validator,
    obscureText: obscureText,
    cursorColor: ColorManager.black,
    keyboardType: textInputType,
    style: const TextStyle(color: ColorManager.black),
    decoration: InputDecoration(
      suffixIcon: icon,
      labelText: labelText,
      labelStyle:
          const TextStyle(color: ColorManager.black, fontSize: AppSize.s16),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 2,
          color: ColorManager.black,
        ), //<-- SEE HERE
        borderRadius: BorderRadius.circular(10.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 2,
          color: ColorManager.black,
        ), //<-- SEE HERE
        borderRadius: BorderRadius.circular(10.0),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 2,
          color: ColorManager.redLight,
        ), //<-- SEE HERE
        borderRadius: BorderRadius.circular(10.0),
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 2,
          color: ColorManager.black,
        ), //<-- SEE HERE
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
  );
}
