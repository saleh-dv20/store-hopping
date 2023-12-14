import 'package:get/get.dart';
import 'package:homy_desine/app/domain/entities/products_entity.dart';
import 'package:homy_desine/app/domain/usecase/products_csecas/get_popular_usecase.dart';

class PopularController extends GetxController {
  final GetPopularUsecase getPopularUsecase;

  PopularController(this.getPopularUsecase);

  // prammetrs
  RxList<ProductsEntitie> popular = <ProductsEntitie>[].obs;
  RxBool isLo = false.obs;

  void _getPopular() async {
    isLo(true);

    try {
      final items = await getPopularUsecase.execuse();
      for (var e in items) {
        popular.add(e);
      }
    } finally {
      isLo(false);
    }
  }

  @override
  void onInit() {
    _getPopular();
    super.onInit();
  }
}
