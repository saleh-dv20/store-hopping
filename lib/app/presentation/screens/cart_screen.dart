import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homy_desine/app/presentation/controller/cart_controller.dart';
import 'package:homy_desine/app/presentation/widgets/card_widget/card_widget.dart';
import 'package:homy_desine/core/manager/colors_manager.dart';
import 'package:homy_desine/core/manager/strings_manager.dart';
import 'package:homy_desine/core/manager/values_manager.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: GetBuilder<CartController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ColorManager.sideColor,
          centerTitle: true,
          title: Text(
            StringManager.cart,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        body: controller.products.length == 0
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSize.s40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      StringManager.emptyImage,
                      height: AppSize.s300,
                      width: AppSize.s300,
                    ),
                    Text(
                      //! No theme here
                      StringManager.emptyCart,
                      style: const TextStyle(
                        fontSize: AppSize.s30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
            : Column(
                children: [
                  SizedBox(
                    height: AppSize.s600,
                    child: ListView.separated(
                        scrollDirection: Axis.vertical,
                        itemCount: controller.products.length,
                        separatorBuilder: (context, index) => const SizedBox(
                              height: AppSize.s10,
                            ),
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              CartWidget(
                                index: index,
                                controller: controller,
                                productsEntitie:
                                    controller.products.keys.toList()[index],
                                quality:
                                    controller.products.values.toList()[index],
                              ),
                            ],
                          );
                        }),
                  ),
                  //
                  orderWidger(
                    context,
                    
                    controller: controller,

                  ),
                ],
              ),
      );
    }));
  }
}
