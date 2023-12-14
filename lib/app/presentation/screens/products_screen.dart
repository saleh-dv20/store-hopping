import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:homy_desine/app/presentation/controller/items_contollers.dart';
import 'package:homy_desine/app/presentation/screens/detilse_screen.dart';
import 'package:homy_desine/core/manager/colors_manager.dart';
import 'package:homy_desine/core/manager/strings_manager.dart';
import 'package:homy_desine/core/manager/values_manager.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<ItemsController>(builder: (controller) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
              elevation: 0,
              backgroundColor: ColorManager.sideColor,
              centerTitle: true,
              title: Text(
                StringManager.products,
                style: Theme.of(context).textTheme.headlineMedium,
              )),
          body: ListView.separated(
            itemCount: controller.products.length,
            separatorBuilder: (context, index) => const SizedBox(
              height: 0,
            ),
            itemBuilder: (context, index) {
              final item = controller.products[index];
              return InkWell(
                onTap: () {
                  Get.to(
                    DetailsScreen(
                      productsEntitie: item,
                      title: item.title,
                      overView: item.description,
                      price: item.price,
                      image: item.image,
                      rate: item.rate,
                    ),
                  );
                },
                child: items(
                  image: item.image,
                  overview: item.description,
                  price: item.price,
                ),
              );
            },
          ),
        ),
      );
    });
  }

  Widget items({
    required String image,
    required String overview,
    required double price,
  }) {
    return Container(
      color: ColorManager.sideColor,
      height: AppSize.s200,
      margin: const EdgeInsets.only(top: AppSize.s10),
      child: Padding(
        padding: const EdgeInsets.only(left: AppSize.s30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              image,
              height: AppSize.s140,
              width: AppSize.s100,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.only(left: AppSize.s15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: AppSize.s200,
                    child: Text(
                      overview,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: ColorManager.white,
                        fontSize: AppSize.s16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Text(
                    '\$$price',
                    style: const TextStyle(
                      color: ColorManager.white,
                      fontSize: AppSize.s16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
