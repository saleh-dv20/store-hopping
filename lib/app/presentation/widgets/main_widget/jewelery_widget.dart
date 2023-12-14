import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homy_desine/app/presentation/screens/detilse_screen.dart';
import 'package:homy_desine/app/presentation/controller/trending_controller.dart';
import 'package:homy_desine/core/constans/is_loading.dart';
import 'package:homy_desine/core/manager/values_manager.dart';

class JeweleryWidget extends StatelessWidget {
  const JeweleryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TrendingController controller = Get.find();
    return Obx(() {
      return controller.isLo.value
          ? loading()
          : Padding(
              padding: const EdgeInsets.only(
                bottom: AppSize.s50,
              ),
              child: SizedBox(
                height: AppSize.s400,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.poplarIt.length,
                  itemBuilder: (context, index) {
                    final item = controller.poplarIt[index];
                    return InkWell(
                      onTap: () {
                        Get.to(DetailsScreen(
                          productsEntitie: item,
                          rate: item.rate,
                          image: item.image,
                          title: item.title,
                          overView: item.description,
                          price: item.price,
                        ));
                      },
                      child: items(
                        dicreption: item.description,
                        price: item.price,
                        image: item.image,
                      ),
                    );
                  },
                ),
              ),
            );
    });
  }

  Widget items({
    required String dicreption,
    required String image,
    required double price,
  }) =>
      Container(
        width: AppSize.s200,
        margin: const EdgeInsets.only(left: AppSize.s15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s15),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: AppSize.s335,
            ),
            //
            Positioned(
              top: AppSize.s75,
              left: AppSize.s20,
              child: Container(
                padding: const EdgeInsets.only(
                    left: AppSize.s10, right: AppSize.s20),
                height: AppSize.s270,
                width: AppSize.s200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(AppSize.s15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: AppSize.s150,
                    ),
                    Text(
                      dicreption,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: AppSize.s20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      '\$$price',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: AppSize.s20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: AppSize.s20),
                    Row(
                      children: [
                        for (int i = 0; i <= 2; i++)
                          Icon(
                            Icons.circle,
                            color: i % 2 == 1
                                ? Colors.brown
                                : Colors.brown.shade100,
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            //
            Positioned(
              top: AppSize.s25,
              left: AppSize.s50,
              child: Container(
                height: AppSize.s160,
                width: AppSize.s140,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(image),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            )
          ],
        ),
      );
}
