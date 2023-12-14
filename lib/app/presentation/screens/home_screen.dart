import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homy_desine/app/presentation/widgets/main_widget/jewelery_widget.dart';
import 'package:homy_desine/core/getx/route/route.dart';
import 'package:homy_desine/core/manager/values_manager.dart';
import 'package:badges/badges.dart' as badges;

import '../../../core/manager/colors_manager.dart';
import '../../../core/manager/strings_manager.dart';
import '../controller/cart_controller.dart';
import '../widgets/main_widget/popular_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            //! Left Side ...
            Padding(
              padding:
                  const EdgeInsets.only(top: AppSize.s15, left: AppSize.s20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    IconManager.menu,
                    size: AppSize.s30,
                    color: ColorManager.white,
                  ),
                  const SizedBox(
                    height: AppSize.s60,
                  ),
                  Text(
                    StringManager.treding,
                    style: Theme.of(context).textTheme.headlineMedium,
                  )
                ],
              ),
            ),

            //! Right Side ...

            Align(
              alignment: Alignment.topRight,
              child: Container(
                width: AppSize.s80,
                height: double.infinity,
                color: ColorManager.sideColor,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: AppSize.s15,
                  ),
                  child: Column(
                    children: [
                      GetBuilder<CartController>(builder: (controller) {
                        return badges.Badge(
                          badgeContent: Text(
                            '${controller.quantity()}',
                            style: const TextStyle(
                              fontSize: 20,
                              color: ColorManager.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          badgeStyle: const badges.BadgeStyle(
                            badgeColor: ColorManager.white,
                          ),
                          position: badges.BadgePosition.topEnd(end: -5),
                          showBadge: controller.quantity() > 0 ? true : false,
                          child: IconButton(
                            onPressed: () {
                              Get.toNamed(RouteName.cartScreen);
                            },
                            icon: const Icon(
                              IconManager.cart,
                              color: ColorManager.white,
                              size: AppSize.s30,
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ),

            //! Apis Items ....
            const Align(
              alignment: Alignment.center,
              child: JeweleryWidget(),
            ),
            //
            Positioned(
              top: 510,
              child: Padding(
                padding: const EdgeInsets.only(left: AppSize.s20),
                child: Text(
                  StringManager.popular,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
            // Popular bottom items ......
            const Positioned(
              top: 540,
              child: PopularBottomWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
