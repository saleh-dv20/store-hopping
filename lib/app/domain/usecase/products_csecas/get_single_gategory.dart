import 'package:homy_desine/app/domain/entities/products_entity.dart';
import 'package:homy_desine/app/domain/repository/base_jewelery_repository.dart';

class GetSingleGategoryUseCase {
  final BaseProductsRepository baseProductsRepository;

  GetSingleGategoryUseCase(this.baseProductsRepository);

  Future<List<ProductsEntitie>> execuse(String gategory) async {
    return await baseProductsRepository.singleGategory(gategory);
  }
}
