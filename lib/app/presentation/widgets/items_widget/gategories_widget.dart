import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homy_desine/app/presentation/controller/items_contollers.dart';
import 'package:homy_desine/app/presentation/screens/single_gategory_screen.dart';
import 'package:homy_desine/core/constans/is_loading.dart';
import 'package:homy_desine/core/manager/colors_manager.dart';
import 'package:homy_desine/core/manager/values_manager.dart';

class GategoriesWidget extends StatelessWidget {
  const GategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return gategoriesWidget();
  }

 
}
 Widget gategoriesWidget() {
    ItemsController controller = Get.find();
    return Obx(() {
      return controller.isGaLo.value
          ? Container(
              width: AppSize.s400,
              alignment: Alignment.topRight,
              child: loading(),
            )
          : SizedBox(
              width: AppSize.s400,
              height: AppSize.s50,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: controller.gategories.length,
                separatorBuilder: (context, index) => const SizedBox(
                  width: AppSize.s5,
                ),
                itemBuilder: (context, index) {
                  final items = controller.gategories[index];
                  return InkWell(
                    onTap: () {
                      controller.getSingleGategory(items);
                      Get.to(
                        SingleGategoryWidget(
                          title: items,
                        ),
                      );
                    },
                    child: Container(
                      width: AppSize.s150,
                      decoration: BoxDecoration(
                        color: ColorManager.white,
                        borderRadius: BorderRadius.circular(AppSize.s10),
                      ),
                      child: Center(
                        child: Text(
                          items,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
    });
  }
