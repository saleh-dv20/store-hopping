import 'package:homy_desine/app/domain/entities/products_entity.dart';
import 'package:homy_desine/app/domain/repository/base_jewelery_repository.dart';

class GetTrendingUsecase {
  final BaseProductsRepository baseJeweleryRepository;

  GetTrendingUsecase({required this.baseJeweleryRepository});

  // execues method
  Future<List<ProductsEntitie>> execuse() async {
    return baseJeweleryRepository.trending();
  }
}
