import 'package:get/get.dart';
import 'package:homy_desine/app/presentation/controller/cart_controller.dart';
import 'package:homy_desine/app/presentation/controller/items_contollers.dart';

import '../../../app/presentation/controller/popular_controller.dart';
import '../../../app/presentation/controller/trending_controller.dart';
import '../../service/servisce_locator.dart';

class ProductsBindig extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>TrendingController(sl()));
    Get.lazyPut(()=>PopularController(sl()));
    Get.lazyPut(()=>ItemsController(sl(), sl(), sl()));
    Get.put(CartController(), permanent: true);
  }
}
