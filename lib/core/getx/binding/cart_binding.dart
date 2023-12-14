import 'package:get/get.dart';
import 'package:homy_desine/app/presentation/controller/cart_controller.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CartController() ,fenix: true);
  }
}
