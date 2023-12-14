import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homy_desine/app/domain/entities/products_entity.dart';
import 'package:homy_desine/app/presentation/controller/cart_controller.dart';
import 'package:homy_desine/core/getx/route/route.dart';
import 'package:homy_desine/core/manager/colors_manager.dart';
import 'package:homy_desine/core/manager/values_manager.dart';
import 'package:badges/badges.dart' as badges;
import '../widgets/detilse_widget/details_widget.dart';

class DetailsScreen extends StatelessWidget {
  final String image;
  final String title;
  final String overView;
  final double price;
  final double rate;
  final ProductsEntitie productsEntitie;

  const DetailsScreen({
    super.key,
    required this.title,
    required this.overView,
    required this.price,
    required this.image,
    required this.rate,
    required this.productsEntitie,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            //! bottom side
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                width: AppSize.s400,
                height: AppSize.s200,
                padding: const EdgeInsets.only(top: AppSize.s120),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: AppSize.s200,
                      child: Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: AppSize.s20,
                          fontWeight: FontWeight.bold,
                          color: ColorManager.white,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: AppSize.s200,
                        width: AppSize.s80,
                        color: ColorManager.sideColor,
                        child: const Icon(
                          IconManager.forward,
                          size: AppSize.s30,
                          color: ColorManager.white,
                        ),
                      ),
                    ),
                  ],
                ),
                // child:
              ),
            ),
            //! Center Side ...
            Positioned(
              top: AppSize.s100,
              right: AppSize.s1,
              left: AppSize.s6,
              child: GetBuilder<CartController>(
                builder: (cartController) => DetailsWidget(
                  cartController: cartController,
                  productsEntitie: productsEntitie,
                  rate: rate,
                  image: image,
                  title: title,
                  overView: overView,
                  price: price,
                ),
              ),
            ),

            //! Left Side
            Padding(
              padding: const EdgeInsets.only(
                left: AppSize.s25,
                top: AppSize.s30,
              ),
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  IconManager.backArrowForward,
                  color: ColorManager.white,
                ),
              ),
            ),

            //! Right Side
            Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: const EdgeInsets.only(top: AppSize.s15),
                height: AppSize.s450,
                width: AppSize.s80,
                color: ColorManager.lightBlack,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //! No theme here
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

                    const SizedBox(
                      height: AppSize.s80,
                    ),
                    Icon(
                      IconManager.heart,
                      color: ColorManager.redLight,
                      size: AppSize.s30,
                    ),
                    const SizedBox(
                      height: AppSize.s60,
                    ),
                    Column(
                      children: [
                        for (int i = 0; i <= 2; i++)
                          Container(
                            margin: const EdgeInsets.only(bottom: AppSize.s15),
                            child: Icon(
                              Icons.circle,
                              color: i % 2 == 1
                                  ? ColorManager.brown
                                  : ColorManager.brownLight,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            //
          ],
        ),
      ),
    );
  }
}
