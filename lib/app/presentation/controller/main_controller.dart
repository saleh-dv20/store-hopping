import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homy_desine/app/domain/entities/profile_entites.dart';
import 'package:homy_desine/app/domain/usecase/user_usecase/get_user_usecase.dart';
import 'package:homy_desine/app/presentation/screens/home_screen.dart';
import 'package:homy_desine/app/presentation/screens/items_screen.dart';
import 'package:homy_desine/app/presentation/screens/person_screen.dart';

class MainController extends GetxController {
  RxInt currernIndex = 1.obs;

  final GetProfileUseCase getProfileUseCase;
  MainController(this.getProfileUseCase);
  late ProfileEntitie data;
  RxBool isLoa = false.obs;

  List<Widget> pages = const [
    HomeScreen(),
    ItemsScreen(),
    PersonScreen(),
  ];

  getUsers() async {
    isLoa(true);
    try {
      data = await getProfileUseCase.excuse();
    } finally {
      isLoa(false);
    }
  }

  @override
  void onInit() {
    getUsers();
    super.onInit();
  }
}
