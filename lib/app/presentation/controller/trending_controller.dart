import 'package:get/get.dart';
import 'package:homy_desine/app/domain/usecase/products_csecas/get_trending_usecase.dart';

import '../../domain/entities/products_entity.dart';

class TrendingController extends GetxController {
  final GetTrendingUsecase getTrendingUsecase;
  TrendingController(this.getTrendingUsecase);
  // Prammetrs
  RxList<ProductsEntitie> poplarIt = <ProductsEntitie>[].obs;
  RxBool isLo = false.obs;

  void _getTrendingItems() async {
    isLo(true);
    final result = await getTrendingUsecase.execuse();

    try {
      for (var e in result) {
        poplarIt.add(e);
      }
    } finally {
      isLo(false);
    }
  }

  @override
  void onInit() {
    _getTrendingItems();
    super.onInit();
  }
}
