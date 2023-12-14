import 'package:get/get.dart';
import 'package:homy_desine/app/domain/entities/products_entity.dart';
import 'package:homy_desine/app/domain/usecase/products_csecas/get_all_gategories_usecase.dart';
import 'package:homy_desine/app/domain/usecase/products_csecas/get_all_usecase.dart';
import 'package:homy_desine/app/domain/usecase/products_csecas/get_single_gategory.dart';

class ItemsController extends GetxController {
  final GetAllUseCase getAllUseCase;
  final GetAllGategoriesUseCase gategoriesUseCase;
  final GetSingleGategoryUseCase getSingleGategorysUseCase;

  ItemsController(this.getAllUseCase, this.gategoriesUseCase,
      this.getSingleGategorysUseCase);

  // All Prodcuts
  RxBool isALo = false.obs;
  RxList<ProductsEntitie> products = <ProductsEntitie>[].obs;
  // All Gategories

  RxBool isGaLo = false.obs;
  RxList<String> gategories = <String>[].obs;

  // Single Gategory
  RxBool isSiLoa = false.obs;
  RxList<ProductsEntitie> singleGategory = <ProductsEntitie>[].obs;

  // Methods
  void getAllProducts() async {
    isALo(true);
    final data = await getAllUseCase.execuse();
    try {
      products.addAll(data);
    } finally {
      isALo(false);
    }
  }

  void getAllGategories() async {
    isGaLo(true);
    final data = await gategoriesUseCase.execuse();
    try {
      gategories.addAll(data);
    } finally {
      isGaLo(false);
    }
  }

  void getSingleGategory(String gategory) async {
    singleGategory.clear();
    isSiLoa(true);
    final data = await getSingleGategorysUseCase.execuse(gategory);
    try {
      singleGategory.addAll(data);
    } finally {
      isSiLoa(false);
      
    }
    
  }

  @override
  void onInit() {
    getAllGategories();
    getAllProducts();
    super.onInit();
  }
}
