import 'package:homy_desine/app/domain/entities/products_entity.dart';
import 'package:homy_desine/app/domain/repository/base_jewelery_repository.dart';

class GetPopularUsecase {
  final BaseProductsRepository baseJeweleryRepository;

  GetPopularUsecase({required this.baseJeweleryRepository});

  // execuse method
  Future<List<ProductsEntitie>> execuse() async {
    return baseJeweleryRepository.popular();
  }
}
