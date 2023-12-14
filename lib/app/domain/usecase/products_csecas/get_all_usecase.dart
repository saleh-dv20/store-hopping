import 'package:homy_desine/app/domain/entities/products_entity.dart';
import 'package:homy_desine/app/domain/repository/base_jewelery_repository.dart';

class GetAllUseCase {
  final BaseProductsRepository baseProductsRepository;

  GetAllUseCase(this.baseProductsRepository);

  // Execues Method
  Future<List<ProductsEntitie>> execuse() async {
    return await baseProductsRepository.all();
  }
}
