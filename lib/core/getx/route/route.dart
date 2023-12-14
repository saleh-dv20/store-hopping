import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:homy_desine/app/presentation/screens/cart_screen.dart';
import 'package:homy_desine/app/presentation/screens/check_out_screen.dart';
import 'package:homy_desine/app/presentation/screens/location_screen.dart';
import 'package:homy_desine/app/presentation/screens/main_screen.dart';
import 'package:homy_desine/app/presentation/screens/sign_in_screen.dart';
import 'package:homy_desine/app/presentation/screens/sign_up_screen.dart';
import 'package:homy_desine/core/getx/binding/main_binding.dart';

import '../binding/cart_binding.dart';
import '../binding/products_binding.dart';

class RoutPages {
  static List<GetPage<dynamic>>? page = [

    GetPage(name: RouteName.signInScreen, page: ()=> const SignInScreen(),),
    GetPage(name: RouteName.signUpScreen, page: ()=> const SignUpScreen(),),

    GetPage(
      name: RouteName.mainSceern,
      page: () => const MainScreen(),
      bindings: [
        MainBinding(),
        ProductsBindig(),
      ],
    ),
    GetPage(
      name: RouteName.cartScreen,
      page: () => const CartScreen(),
      binding: CartBinding(),
    ),
   
    GetPage(
      name: RouteName.checkOutScreen,
      page: () => const CheckOutScreen(),
    ),
    GetPage(
      name: RouteName.locationScreen,
      page: () => const LocationScreen(),
    )
  ];
}

class RouteName {
  static const signInScreen = '/signInScreen';
  static const signUpScreen = '/signUpScreen';
  static const splahScreen = '/splashScreen';
  static const mainSceern = '/mainScreen';
  static const cartScreen = '/cartScreen';
  static const checkOutScreen = '/checkOutScreen';
  static const orderScreen = '/orderScreen';
  static const locationScreen = '/locationScreen';
}
