import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:homy_desine/core/constans/is_loading.dart';
import 'package:homy_desine/core/manager/colors_manager.dart';
import 'package:homy_desine/core/manager/values_manager.dart';

import '../controller/my_order_controller.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetX<MyOrderController>(builder: (controller) {
        return controller.isLoa.value
            ? loading()
            : Scaffold(
                body: Stack(
                  children: [
                    GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: LatLng(
                          controller.latitude.value,
                          controller.longitude.value,
                        ),
                        zoom: AppSize.s15,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: InkWell(
                        onTap: () {
                          controller.getPosition();
                          Get.back();
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: AppSize.s20,
                            vertical: AppSize.s20,
                          ),
                          height: AppSize.s60,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: ColorManager.white,
                            borderRadius: BorderRadius.circular(AppSize.s10),
                          ),
                          child: Center(
                            child: Text(
                              'Get my current location',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
      }),
    );
  }
}
