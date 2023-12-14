import 'package:get_it/get_it.dart';
import 'package:homy_desine/app/data/data_source/remot_data_source.dart';
import 'package:homy_desine/app/data/data_source/user_remot_data_source.dart';
import 'package:homy_desine/app/data/repository/products_repository.dart';
import 'package:homy_desine/app/data/repository/profile_repository.dart';
import 'package:homy_desine/app/domain/repository/base_jewelery_repository.dart';
import 'package:homy_desine/app/domain/repository/base_user_rpository.dart';
import 'package:homy_desine/app/domain/usecase/products_csecas/get_all_gategories_usecase.dart';
import 'package:homy_desine/app/domain/usecase/products_csecas/get_all_usecase.dart';
import 'package:homy_desine/app/domain/usecase/products_csecas/get_single_gategory.dart';
import 'package:homy_desine/app/domain/usecase/products_csecas/get_trending_usecase.dart';
import 'package:homy_desine/app/domain/usecase/user_usecase/get_user_usecase.dart';

import '../../app/domain/usecase/products_csecas/get_popular_usecase.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    // 1 Use case
    sl.registerLazySingleton(
        () => GetTrendingUsecase(baseJeweleryRepository: sl()));
    sl.registerLazySingleton(
        () => GetPopularUsecase(baseJeweleryRepository: sl()));
    sl.registerLazySingleton(() => GetAllUseCase(sl()));
    sl.registerLazySingleton(() => GetAllGategoriesUseCase(sl()));
    sl.registerLazySingleton(() => GetSingleGategoryUseCase(sl()));
    //Profile
    sl.registerLazySingleton(
        () => GetProfileUseCase(baseUsreRepository:  sl()));
    //
    // 2 Repository
    sl.registerLazySingleton<BaseProductsRepository>(
        () => ProductsRepository(sl()));
    sl.registerLazySingleton<BaseProfileRepository>(
        () => ProfileRepository(baseProfileRemotDataSource: sl()));
    //
    // 3 Data source
    sl.registerLazySingleton<BaseRemotProductsDataSource>(
        () => RemotProductsDataSource());
    sl.registerLazySingleton<BaseProfileRemotDataSource>(
        () => ProfileRemotDataSource());
  }
}
