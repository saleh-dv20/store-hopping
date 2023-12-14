import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homy_desine/app/presentation/controller/popular_controller.dart';
import 'package:homy_desine/core/constans/is_loading.dart';
import 'package:homy_desine/core/manager/values_manager.dart';

class PopularBottomWidget extends StatelessWidget {
  const PopularBottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<PopularController>(builder: (controller) {
      return controller.isLo.value
          ? Container(
              width: AppSize.s400,
              alignment: Alignment.center,
              child: loading(),
            )
          : SizedBox(
              height: AppSize.s230,
              width: AppSize.s300,
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                itemCount: controller.popular.length,
                separatorBuilder: (context, index) => const SizedBox(
                  height: AppSize.s20,
                ),
                itemBuilder: (context, index) {
                  final item = controller.popular[index];
                  return items(
                    image: item.image,
                    overview: item.description,
                    price: item.price,
                  );
                },
              ),
            );
    });
  }

  Widget items({
    required String image,
    required String overview,
    required double price,
  }) {
    return SizedBox(
      height: AppSize.s150,
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
                    width: AppSize.s155,
                    child: Text(
                      overview,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: AppSize.s16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Text(
                    '\$$price',
                    style: const TextStyle(
                      color: Colors.white,
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
