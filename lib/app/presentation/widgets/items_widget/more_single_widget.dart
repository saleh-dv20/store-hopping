import 'package:flutter/material.dart';
import 'package:homy_desine/core/manager/colors_manager.dart';

import '../../../../core/manager/values_manager.dart';

class MoreSingleWidget extends StatelessWidget {
  final String image;
  final String overview;
  final double price;
  const MoreSingleWidget(
      {super.key,
      required this.image,
      required this.overview,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.sideColor,
      margin: const EdgeInsets.only(top: AppSize.s10),
      height: AppSize.s200,
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
