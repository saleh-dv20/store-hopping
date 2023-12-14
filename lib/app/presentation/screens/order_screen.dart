// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';
import 'package:get/get.dart';
import 'package:homy_desine/app/presentation/controller/cart_controller.dart';
import 'package:homy_desine/app/presentation/controller/my_order_controller.dart';
import 'package:homy_desine/core/constans/is_loading.dart';
import 'package:homy_desine/core/getx/route/route.dart';

import '../../../core/manager/colors_manager.dart';
import '../../../core/manager/strings_manager.dart';
import '../../../core/manager/values_manager.dart';

class OrderScreen extends StatelessWidget {
  final dynamic total;
  const OrderScreen({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    MyOrderController controller = Get.find();
    CartController cartController = Get.find();
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
            left: AppSize.s15,
            top: AppSize.s20,
            right: AppSize.s15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      IconManager.backArrowForward,
                      size: AppSize.s30,
                      color: ColorManager.white,
                    ),
                  ),
                  const SizedBox(width: AppSize.s140),
                  Text(
                    StringManager.myOrder,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
              const SizedBox(
                height: AppSize.s30,
              ),
              const Divider(
                color: ColorManager.white,
                height: AppSize.s2,
              ),
              const SizedBox(
                height: AppSize.s30,
              ),
              Text(
                StringManager.deliveryAddress,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: AppSize.s10,
              ),
              Obx(() {
                return controller.isLoa.value
                    ? loading()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: AppSize.s300,
                            child: Text(
                              controller.address.value,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed(RouteName.locationScreen);

                              controller.determinePosition();
                            },
                            child: Text(
                              StringManager.change,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                        ],
                      );
              }),
              const SizedBox(
                height: AppSize.s30,
              ),
              const Divider(
                color: ColorManager.white,
                height: AppSize.s2,
              ),
              const SizedBox(
                height: AppSize.s30,
              ),
              Text(
                StringManager.payment,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              //! Payment methods
              GetBuilder<MyOrderController>(builder: (_) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: AppSize.s15),
                      height: AppSize.s50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: ColorManager.grey,
                        borderRadius: BorderRadius.circular(AppSize.s20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: AppSize.s20,
                          right: AppSize.s20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              StringManager.paypal,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Radio(
                              activeColor: ColorManager.white,
                              value: 'paypal',
                              groupValue: controller.payChosing,
                              onChanged: (val) {
                                controller.choseIsIt(val);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: AppSize.s10,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: AppSize.s15),
                      height: AppSize.s50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: ColorManager.grey,
                        borderRadius: BorderRadius.circular(AppSize.s20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: AppSize.s20,
                          right: AppSize.s20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              StringManager.cash,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Radio(
                              activeColor: ColorManager.white,
                              value: 'cash',
                              groupValue: controller.payChosing,
                              onChanged: (val) {
                                controller.choseIsIt(val);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }),
              //
              const SizedBox(
                height: AppSize.s30,
              ),
              const Divider(
                color: ColorManager.white,
                height: AppSize.s2,
              ),
              const SizedBox(
                height: AppSize.s30,
              ),
              //! Crt detiles..
              Padding(
                padding: const EdgeInsets.only(right: AppSize.s10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      StringManager.total,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text(
                      '\$$total',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSize.s15),
              Padding(
                padding: const EdgeInsets.only(right: AppSize.s10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      StringManager.deliveryCost,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text(
                      '-\$0.00',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: AppSize.s20,
              ),
              const Divider(
                color: ColorManager.white,
                height: AppSize.s2,
              ),
              const SizedBox(
                height: AppSize.s20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: AppSize.s10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      StringManager.total,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text(
                      '\$$total',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  switch (controller.payChosing) {
                    case 'cash':
                      Get.bottomSheet(
                        congrtulation(context, cartController),
                      );
                      break;
                    case 'paypal':
                      payPal(
                        context,
                      );
                      break;
                    default:
                      Get.snackbar(
                        'Payment Method',
                        'Please the payment method',
                        colorText: ColorManager.white,
                        duration: Duration(seconds: AppSize.s2.toInt()),
                      );
                  }
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: AppSize.s10, vertical: AppSize.s50),
                  height: AppSize.s50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: ColorManager.white,
                    borderRadius: BorderRadius.circular(AppSize.s20),
                  ),
                  child: Center(
                    child: Text(
                      StringManager.confirm,
                      style: const TextStyle(
                        color: ColorManager.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container congrtulation(
    BuildContext context,
    CartController cartController,
  ) {
    return Container(
      color: ColorManager.white,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                IconManager.close,
                size: AppSize.s30,
                color: ColorManager.black,
              ),
            ),
          ),
          Container(
            width: AppSize.s150,
            height: AppSize.s140,
            decoration: const BoxDecoration(
              // color: ColorManager.black,
              image: DecorationImage(
                image: AssetImage(StringManager.orderDone),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: AppSize.s50,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(
              horizontal: AppSize.s20,
            ),
            child: Text(
              StringManager.thank,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(
              horizontal: AppSize.s20,
            ),
            child: Text(
              StringManager.forYou,
              style: const TextStyle(
                fontSize: AppSize.s15,
                color: ColorManager.black,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(
              horizontal: AppSize.s20,
            ),
            child: Text(
              StringManager.orderMassage,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          const SizedBox(
            height: AppSize.s20,
          ),
          InkWell(
            onTap: () {
              //! go to MainScreen
              confirmed(cartController: cartController);
            },
            child: Container(
              margin: const EdgeInsetsDirectional.symmetric(
                horizontal: AppSize.s20,
              ),
              height: AppSize.s50,
              width: AppSize.s150,
              decoration: BoxDecoration(
                color: ColorManager.black,
                borderRadius: BorderRadius.circular(AppSize.s10),
              ),
              child: Center(
                child: Text(
                  StringManager.confirm,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  payPal(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckout(
        sandboxMode: true,
        clientId:
            "AadhOtMn_UCvMyvHbbexajLVpj6mEF3qRSUCk7gnQjrL-B0AuGVRBfEjiXMcU355nJkmn5F1jdvwR0Kb",
        secretKey:
            "EAJCui-ryTmHKnoSz0V-baj16aj640V9SJaEnN52gaf8UFi1E7qlWoNigwpyNeFlB43OAOBMhIjE72j9",
        returnURL: "success.snippetcoder.com",
        cancelURL: "cancel.snippetcoder.com",
        transactions: const [
          {
            "amount": {
              "total": '70',
              "currency": "USD",
              "details": {
                "subtotal": '70',
                "shipping": '0',
                "shipping_discount": 0
              }
            },
            "description": "The payment transaction description.",
            // "payment_options": {
            //   "allowed_payment_method":
            //       "INSTANT_FUNDING_SOURCE"
            // },
            "item_list": {
              "items": [
                {
                  "name": "Apple",
                  "quantity": 4,
                  "price": '5',
                  "currency": "USD"
                },
                {
                  "name": "Pineapple",
                  "quantity": 5,
                  "price": '10',
                  "currency": "USD"
                }
              ],
            }
            //
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          print("onSuccess: $params");
        },
        onError: (error) {
          print("onError: $error");
          Navigator.pop(context);
        },
        onCancel: () {
          print('cancelled:');
        },
      ),
    ));
  }

  void confirmed({required CartController cartController}) {
    cartController.doneOrder();
    Get.offNamed(RouteName.mainSceern);
    Get.snackbar(
      'Massage',
      'Thanks we will send you a massage when it comes',
      colorText: ColorManager.white,
      duration: Duration(seconds: AppSize.s4.toInt()),
    );
  }
}
