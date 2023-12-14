import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homy_desine/app/presentation/controller/main_controller.dart';
import 'package:homy_desine/core/manager/colors_manager.dart';
import 'package:homy_desine/core/manager/values_manager.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<MainController>(builder: (controller) {
      return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: ColorManager.lightBlack,
          unselectedItemColor: ColorManager.praymColor,
          selectedItemColor: ColorManager.white,
          items: const [
            BottomNavigationBarItem(
                label: '',
                icon: Icon(
                  IconManager.home,
                  size: AppSize.s30,
                )),
            BottomNavigationBarItem(
                label: '',
                icon: Icon(
                  IconManager.items,
                  size: AppSize.s30,
                )),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(
                IconManager.person,
                size: AppSize.s30,
              ),
            ),
          ],
          currentIndex: controller.currernIndex.value,
          onTap: (index) {
            controller.currernIndex.value = index;
          },
        ),
        body: IndexedStack(
          index: controller.currernIndex.value,
          children: controller.pages,
        ),
      );
    });
  }
}
