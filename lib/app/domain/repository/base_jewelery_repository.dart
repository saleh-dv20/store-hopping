import 'package:homy_desine/app/domain/entities/products_entity.dart';


abstract class BaseProductsRepository {
  Future<List<ProductsEntitie>> trending();
  Future<List<ProductsEntitie>> popular();
  Future<List<ProductsEntitie>> all();
  Future<List<String>> gategories();
  Future<List<ProductsEntitie>> singleGategory(String gategory);

}
