import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:homy_desine/app/presentation/controller/items_contollers.dart';
import 'package:homy_desine/app/presentation/widgets/items_widget/more_single_widget.dart';
import 'package:homy_desine/core/manager/colors_manager.dart';
import 'package:homy_desine/core/manager/values_manager.dart';

import 'detilse_screen.dart';

class SingleGategoryWidget extends StatelessWidget {
  final String title;
  const SingleGategoryWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    ItemsController controller = Get.find();
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorManager.sideColor,
        centerTitle: true,
        title: Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Obx(() {
        return controller.isSiLoa.value
            ? const Center(
                child: CircularProgressIndicator(
                  color: ColorManager.white,
                ),
              )
            : ListView.separated(
                scrollDirection: Axis.vertical,
                itemCount: controller.singleGategory.length,
                separatorBuilder: (context, index) => const SizedBox(
                  width: AppSize.s5,
                ),
                itemBuilder: (context, index) {
                  final items = controller.singleGategory[index];
                  return InkWell(
                      onTap: () {
                        Get.to(
                          DetailsScreen(
                            productsEntitie: items,
                            title: items.title,
                            overView: items.description,
                            price: items.price,
                            image: items.image,
                            rate: items.rate,
                          ),
                        );
                      },
                      child: MoreSingleWidget(
                        image: items.image,
                        overview: items.description,
                        price: items.price,
                      ));
                },
              );
      }),
   
    ));
  }
}
