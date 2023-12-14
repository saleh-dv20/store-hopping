import 'package:flutter/material.dart';
import 'package:homy_desine/core/manager/colors_manager.dart';



  Center loading() {
    return const Center(
              child: CircularProgressIndicator(
              color: ColorManager.white,
            ));
  }