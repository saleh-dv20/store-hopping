// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:homy_desine/app/domain/entities/products_entity.dart';
import 'package:homy_desine/app/presentation/controller/cart_controller.dart';
import 'package:homy_desine/app/presentation/screens/order_screen.dart';
import 'package:homy_desine/core/getx/binding/order_binding.dart';
import 'package:homy_desine/core/manager/colors_manager.dart';
import 'package:homy_desine/core/manager/strings_manager.dart';
import 'package:homy_desine/core/manager/values_manager.dart';

class CartWidget extends StatelessWidget {
  final CartController controller;
  final ProductsEntitie productsEntitie;
  final int quality;
  final int index;
  const CartWidget({
    super.key,
    required this.controller,
    required this.productsEntitie,
    required this.quality,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.sideColor,
      height: AppSize.s200,
      child: Padding(
        padding: const EdgeInsets.only(left: AppSize.s30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              productsEntitie.image,
              height: AppSize.s140,
              width: AppSize.s100,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.only(left: AppSize.s15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: AppSize.s70,
                  ),
                  SizedBox(
                    width: AppSize.s200,
                    child: Text(
                      productsEntitie.title,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        //! No theme here
                        color: ColorManager.white,
                        fontSize: AppSize.s16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Text(
                    '\$${controller.supTotal[index]}',
                    style: const TextStyle(
                      //! No theme here
                      color: ColorManager.white,
                      fontSize: AppSize.s16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.s20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          controller.remove(productsEntitie);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: ColorManager.white,
                            borderRadius: BorderRadius.circular(AppSize.s15),
                          ),
                          child: const Icon(
                            IconManager.remove,
                            size: AppSize.s30,
                            color: ColorManager.black,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: AppSize.s10,
                      ),
                      Text(
                        '$quality',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(
                        width: AppSize.s10,
                      ),
                      InkWell(
                        onTap: () {
                          controller.addToCart(productsEntitie);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: ColorManager.white,
                            borderRadius: BorderRadius.circular(AppSize.s15),
                          ),
                          child: const Icon(
                            IconManager.add,
                            size: AppSize.s30,
                            color: ColorManager.black,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget orderWidger(
  BuildContext contex, 
  {
  required CartController controller,
}) {
  return Container(
    height: AppSize.s150,
    width: double.infinity,
    color: ColorManager.sideColor,
    child: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSize.s20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: AppSize.s10,
          ),
          const Divider(color: ColorManager.white),
          const SizedBox(
            height: AppSize.s20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                StringManager.total,
                style: Theme.of(contex).textTheme.headlineMedium,
              ),
              Text(
                '\$${controller.total}',
              ),
            ],
          ),
          Center(
            child: InkWell(
              onTap: () {
                Get.to(() => OrderScreen(total: controller.total),
                    binding: OrderBinding());
              
              },
              child: Container(
                margin: const EdgeInsets.only(top: AppSize.s15),
                height: AppSize.s50,
                width: AppSize.s120,
                decoration: BoxDecoration(
                  color: ColorManager.white,
                  borderRadius: BorderRadiusDirectional.circular(AppSize.s20),
                ),
                child: Center(
                  child: Text(
                    StringManager.checkOut,
                    style: const TextStyle(
                      color: ColorManager.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
