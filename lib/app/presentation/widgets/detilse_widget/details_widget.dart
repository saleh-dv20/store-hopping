import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:homy_desine/app/domain/entities/products_entity.dart';
import 'package:homy_desine/app/presentation/controller/cart_controller.dart';
import 'package:homy_desine/core/manager/strings_manager.dart';

import '../../../../core/manager/colors_manager.dart';
import '../../../../core/manager/values_manager.dart';

class DetailsWidget extends StatelessWidget {
  final CartController cartController;
  final ProductsEntitie productsEntitie;
  final String image;
  final String title;
  final String overView;
  final double price;
  final double rate;
  const DetailsWidget({
    super.key,
    required this.cartController,
    required this.productsEntitie,
    required this.image,
    required this.title,
    required this.overView,
    required this.price,
    required this.rate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.sd500,
      height: AppSize.s630,
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(AppSize.s20),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
            left: AppSize.s30, top: AppSize.s16, right: AppSize.s30),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            height: AppSize.s280,
            width: AppSize.s200,
            // color: Colors.amber,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(image)),
            ),
          ),
          const SizedBox(height: AppSize.s15),
          SizedBox(
            width: AppSize.s200,
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: AppSize.s30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: AppSize.s15),
          Row(
            children: [
              RatingBar(
                initialRating: rate,
                minRating: AppSize.s1,
                maxRating: AppSize.s5,
                itemSize: AppSize.s30,
                direction: Axis.horizontal,
                allowHalfRating: true,
                ratingWidget: RatingWidget(
                  full: const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  half: Icon(
                    Icons.star,
                    color: ColorManager.lightBlack,
                  ),
                  empty: const Icon(
                    Icons.star,
                    color: Colors.grey,
                  ),
                ),
                onRatingUpdate: (double value) {
                  value;
                },
              ),
            ],
          ),
          const SizedBox(height: AppSize.s15),
          SizedBox(
            width: AppSize.s330,
            child: Text(
              overView,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              style: TextStyle(
                fontSize: AppSize.s20,
                fontWeight: FontWeight.w300,
                color: Colors.grey.shade800,
              ),
            ),
          ),
          const SizedBox(height: AppSize.s15),
          const Divider(
            color: Colors.black,
            thickness: AppSize.s2,
          ),
          const SizedBox(height: AppSize.s15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$$price',
                style: const TextStyle(
                  fontSize: AppSize.s20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              InkWell(
                onTap: () {
                  cartController.addToCart(productsEntitie);
                },
                child: Container(
                  width: AppSize.s150,
                  height: AppSize.s50,
                  padding: const EdgeInsets.symmetric(horizontal: AppSize.s10),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(AppSize.s15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        StringManager.cart,
                        style: const TextStyle(
                          fontSize: AppSize.s20,
                          color: ColorManager.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Icon(
                        IconManager.add,
                        color: ColorManager.black,
                        size: AppSize.s30,
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
