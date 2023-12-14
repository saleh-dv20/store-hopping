import 'package:homy_desine/app/domain/repository/base_jewelery_repository.dart';

class GetAllGategoriesUseCase {
  final BaseProductsRepository baseProductsRepository;

  GetAllGategoriesUseCase(this.baseProductsRepository);

// Method
  Future<List<String>> execuse() async {
    return await baseProductsRepository.gategories();
  }
}
