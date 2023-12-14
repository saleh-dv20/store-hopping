// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:homy_desine/core/manager/colors_manager.dart';
import 'package:homy_desine/core/manager/values_manager.dart';
  // TODO fix the location problem...
class MyOrderController extends GetxController {
  RxString address = 'Jeddaha,Al Saffa, Om Al Quraa Street'.obs;
  RxBool isLoa = false.obs;
  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  Future<dynamic> dialog() {
    return Get.defaultDialog(
      title: 'Location Service',
      middleText: 'Please Open The Location',
      middleTextStyle: const TextStyle(fontSize: 18, color: ColorManager.black),
      actions: [
        InkWell(
          onTap: () {
            //! : Go back to cart if location is disable
            Get.back();
          },
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: ColorManager.grey,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: ColorManager.white),
            ),
            child: const Center(child: Text('No')),
          ),
        ),
        InkWell(
          onTap: () => Get.back(),
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: ColorManager.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: ColorManager.black, width: AppSize.s2),
            ),
            child: const Center(
                child: Text(
              'Yes',
              style: TextStyle(color: ColorManager.black),
            )),
          ),
        )
      ],
    );
  }

  Future<void> getPosition() async {
    isLoa(true);
    Position position = await determinePosition();
    latitude.value = position.latitude;
    longitude.value = position.longitude;
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude.value, longitude.value);
    Placemark place = placemarks[0];
    address.value = '${place.country},${place.locality},${place.subLocality}';
    isLoa(false);
    update();
  }

  //  payment methods...
  // ignore: prefer_typing_uninitialized_variables
  var payChosing;
  choseIsIt(var val) {
    payChosing = val;
    update();
  }
}
