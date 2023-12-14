import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homy_desine/app/presentation/controller/items_contollers.dart';
import 'package:homy_desine/app/presentation/screens/detilse_screen.dart';
import 'package:homy_desine/app/presentation/widgets/items_widget/more_single_widget.dart';
import 'package:homy_desine/core/manager/colors_manager.dart';
import 'package:homy_desine/core/manager/values_manager.dart';

class SearchWidget extends SearchDelegate {
  final controller = Get.find<ItemsController>();
  List<String> items = [];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(
          IconManager.clear,
          color: ColorManager.black,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(
        IconManager.backArrowForward,
        color: ColorManager.black,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    //  Resulet
    return resulets();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //  show when user searchs for something
    List<String> data = [];
    for (var i = 0; i < controller.gategories.length; i++) {
      data.add(controller.gategories[i]);
    }
    for (var fruit in items) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        data.add(fruit);
      }
    }
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          final item = data[index];
          return ListTile(
            title: Text(
              item,
              style: const TextStyle(
                color: ColorManager.white,
              ),
            ),
            onTap: () {
              query = item;
              controller.getSingleGategory(query);
              showResults(context);
            },
          );
        });
  }

  //! Widget to show the resluts of searching ..
  Widget resulets() {
    return Obx(() {
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
    });
  }
}
