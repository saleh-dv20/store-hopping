import 'package:homy_desine/app/data/data_source/remot_data_source.dart';
import 'package:homy_desine/app/domain/entities/products_entity.dart';
import 'package:homy_desine/app/domain/repository/base_jewelery_repository.dart';

class ProductsRepository implements BaseProductsRepository {
  final BaseRemotProductsDataSource baseRemotJeweleryDataSource;

  ProductsRepository(this.baseRemotJeweleryDataSource);

  @override
  Future<List<ProductsEntitie>> popular() async {
    return await baseRemotJeweleryDataSource.getPopular();
  }

  @override
  Future<List<ProductsEntitie>> trending() async {
    return await baseRemotJeweleryDataSource.getTrending();
  }

  @override
  Future<List<ProductsEntitie>> all() async {
    return await baseRemotJeweleryDataSource.getAll();
  }
  
  @override
  Future<List<String>> gategories() async{
  return await baseRemotJeweleryDataSource.getAllGategories();
  }
  
  @override
  Future<List<ProductsEntitie>> singleGategory(String gategory) async{
    return await baseRemotJeweleryDataSource.getSingleGategory(gategory);
  }
}
