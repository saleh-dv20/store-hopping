// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';
import 'package:homy_desine/core/manager/colors_manager.dart';
import 'package:homy_desine/core/manager/strings_manager.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO : Make theme for AppBar for the best...
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorManager.sideColor,
        centerTitle: true,
        title: Text(
          StringManager.checkOut,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body:Center(
        child: TextButton(
          onPressed: () async {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => 
              
              PaypalCheckout(
                sandboxMode: true,
                clientId: "AadhOtMn_UCvMyvHbbexajLVpj6mEF3qRSUCk7gnQjrL-B0AuGVRBfEjiXMcU355nJkmn5F1jdvwR0Kb",
                secretKey: "EAJCui-ryTmHKnoSz0V-baj16aj640V9SJaEnN52gaf8UFi1E7qlWoNigwpyNeFlB43OAOBMhIjE72j9",
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

                      // shipping address is not required though
                      //   "shipping_address": {
                      //     "recipient_name": "Raman Singh",
                      //     "line1": "Delhi",
                      //     "line2": "",
                      //     "city": "Delhi",
                      //     "country_code": "IN",
                      //     "postal_code": "11001",
                      //     "phone": "+00000000",
                      //     "state": "Texas"
                      //  },
                    }
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
          
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.teal,
            foregroundColor: Colors.white,
            shape: const BeveledRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(1),
              ),
            ),
          ),
          child: const Text('Checkout'),
        ),
      ),
    );
  }
}
