import 'package:homy_desine/app/data/modles/products_modle.dart';
import 'package:dio/dio.dart';
import 'package:homy_desine/core/constans/api_manager.dart';

abstract class BaseRemotProductsDataSource {
  Future<List<ProductsyModle>> getTrending();
  Future<List<ProductsyModle>> getPopular();
  Future<List<ProductsyModle>> getAll();
  Future<List<ProductsyModle>> getSingleGategory(String gategory);
  Future<List<String>> getAllGategories();
  
}

// Concleand implementation Class
class RemotProductsDataSource extends BaseRemotProductsDataSource {
  final _dio = Dio();

  @override
  Future<List<ProductsyModle>> getPopular() async {
    final respon = await _dio.get(ApiManager.closeUrl);
    if (respon.statusCode == 200) {
      return List<ProductsyModle>.from(
          (respon.data as List).map((e) => ProductsyModle.fromJson(e)));
    } else {
      throw Exception('NO DATA HERE==========');
    }
  }

  @override
  Future<List<ProductsyModle>> getTrending() async {
    final respons = await _dio.get(ApiManager.closeUrl);
    if (respons.statusCode == 200) {
      return List<ProductsyModle>.from(
          (respons.data as List).map((e) => ProductsyModle.fromJson(e)));
    } else {
      throw Exception('PROBLEM IN API RESPONS ================');
      // return [];
    }
  }

  @override
  Future<List<ProductsyModle>> getAll() async {
    final respons = await _dio.get(ApiManager.baseUrl);
    if (respons.statusCode == 200) {
      return List<ProductsyModle>.from(
        (respons.data as List).map(
          (e) => ProductsyModle.fromJson(e),
        ),
      );
    } else {
      throw Exception('PROBLEM IN API RESPONS ================');
      // return [];
    }
  }

  @override
  Future<List<String>> getAllGategories() async {
    final response = await _dio.get(ApiManager.allGategories);
    if (response.statusCode == 200) {
    
      return List<String>.from((response.data as List).map((e) => e));
    } else {
      throw Exception('Erorr Gategories Failed');
    }
  }

  @override
  Future<List<ProductsyModle>> getSingleGategory(String gategory) async {
    final respons = await _dio.get(ApiManager.singleGategories(gategory));
    if (respons.statusCode == 200) {
      return List<ProductsyModle>.from(
        (respons.data as List).map(
          (e) => ProductsyModle.fromJson(e),
        ),
      );
    } else {
      throw Exception('PROBLEM IN API RESPONS ================');
      // return [];
    }
  }
}
