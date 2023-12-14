import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homy_desine/app/presentation/controller/cart_controller.dart';
import 'package:homy_desine/app/presentation/widgets/items_widget/all_products_widget.dart';
import 'package:homy_desine/app/presentation/widgets/items_widget/gategories_widget.dart';
import 'package:homy_desine/app/presentation/widgets/items_widget/search_widget.dart';
import 'package:homy_desine/core/getx/route/route.dart';
import 'package:homy_desine/core/manager/colors_manager.dart';
import 'package:homy_desine/core/manager/strings_manager.dart';
import 'package:homy_desine/core/manager/values_manager.dart';
import 'package:badges/badges.dart' as badges;

import 'products_screen.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            //! The Lift Side...
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
                    StringManager.gategories,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            ),
            //! The Right Side
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
                            //! No theme here...
                            style: const TextStyle(
                              fontSize: AppSize.s20,
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
                      const SizedBox(
                        height: AppSize.s60,
                      ),
                      InkWell(
                        onTap: () {
                          showSearch(
                              context: context, delegate: SearchWidget(),);
                        },
                        child: const Icon(
                          IconManager.search,
                          color: ColorManager.white,
                          size: AppSize.s30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            //! All Gatigories....
            const Positioned(
              top: AppSize.s200,
              child: GategoriesWidget(),
            ),
            //! All Prodcuts ....
            Positioned(
              top: AppSize.s335,
              left: AppSize.s20,
              right: 5,
              child: SizedBox(
                width: AppSize.s400,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      StringManager.products,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(const ProductsScreen());
                      },
                      child: Text(
                        StringManager.seeMore,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Positioned(
              top: AppSize.s400,
              left: AppSize.s8,
              child: AllProductsWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
