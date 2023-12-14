import 'package:get/get.dart';
import 'package:homy_desine/app/presentation/controller/auth_controller.dart';
import 'package:homy_desine/app/presentation/controller/main_controller.dart';

import '../../service/servisce_locator.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>MainController(sl()));
    Get.lazyPut(()=>AuthController());
  }
}
