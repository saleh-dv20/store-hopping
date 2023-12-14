import 'package:get/get.dart';
import 'package:homy_desine/app/domain/entities/products_entity.dart';
import 'package:homy_desine/core/manager/colors_manager.dart';

class CartController extends GetxController {
  final _cartProducts = {};

  void addToCart(ProductsEntitie productsEntitie) {
    if (_cartProducts.containsKey(productsEntitie)) {
      _cartProducts[productsEntitie] += 1;
    } else {
      _cartProducts[productsEntitie] = 1;
    }
    Get.snackbar(
      'Products Added',
      'You have added ${productsEntitie.title} to your cart',
      colorText: ColorManager.white,
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 1),
    );
    update();
  }

  void remove(ProductsEntitie productsEntitie) {
    if (_cartProducts.containsKey(productsEntitie) &&
        _cartProducts[productsEntitie] == 1) {
      _cartProducts.removeWhere((key, value) => key == productsEntitie);
    } else {
      _cartProducts[productsEntitie] -= 1;
    }
    update();
  }

  //! use it when costomer finshs his order
  void doneOrder() {
    _cartProducts.clear();
  }

  get products => _cartProducts;

  get supTotal =>
      _cartProducts.entries.map((e) => e.key.price * e.value).toList();

  get total => _cartProducts.entries
      .map((e) => e.key.price * e.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);

  int quantity() {
    return _cartProducts.isEmpty
        ? 0
        : _cartProducts.entries
            .map((e) => e.value)
            .toList()
            .reduce((value, element) => value + element);
  }
}
