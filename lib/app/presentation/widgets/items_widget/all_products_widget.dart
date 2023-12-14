import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homy_desine/app/presentation/controller/items_contollers.dart';
import 'package:homy_desine/app/presentation/screens/detilse_screen.dart';
import 'package:homy_desine/core/constans/is_loading.dart';
import 'package:homy_desine/core/manager/colors_manager.dart';
import 'package:homy_desine/core/manager/values_manager.dart';

class AllProductsWidget extends StatelessWidget {
  const AllProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<ItemsController>(builder: (controller) {
      return controller.isALo.value
          ? Container(
              width: AppSize.s400,
              alignment: Alignment.center,
              child: loading(),
            )
          : SizedBox(
              height: AppSize.s290,
              width: AppSize.s400,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: controller.products.length,
                separatorBuilder: (context, index) => const SizedBox(
                  width: AppSize.s10,
                ),
                itemBuilder: (context, index) {
                  final items = controller.products[index];
                  return InkWell(
                    onTap: () {
                      Get.to(
                        DetailsScreen(
                          title: items.title,
                          overView: items.description,
                          price: items.price,
                          image: items.image,
                          rate: items.rate,
                          productsEntitie: items,
                        ),
                      );
                    },
                    child: Container(
                      width: AppSize.s200,
                      decoration: BoxDecoration(
                        color: ColorManager.white,
                        borderRadius: BorderRadius.circular(AppSize.s20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                                left: AppSize.s20, top: AppSize.s10),
                            child: Image.network(
                              items.image,
                              fit: BoxFit.contain,
                              height: AppSize.s200,
                              width: AppSize.s150,
                            ),
                          ),
                          //! Dicreption
                          Container(
                            padding: const EdgeInsets.only(left: AppSize.s10),
                            width: AppSize.s200,
                            child: Text(
                              items.description,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: ColorManager.lightBlack,
                                fontSize: AppSize.s20,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: AppSize.s10),
                            child: Text(
                              '\$${items.price}',
                              style: const TextStyle(
                                color: ColorManager.black,
                                fontSize: AppSize.s20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
    });
  }
}
