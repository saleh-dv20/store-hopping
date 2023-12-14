import 'package:get/get.dart';
import 'package:homy_desine/app/presentation/controller/my_order_controller.dart';

class OrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyOrderController());
  }
}
