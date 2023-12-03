import 'dart:developer';

import 'package:ecommerce_task/controller/cart_controllerd.dart';
import 'package:ecommerce_task/controller/payment_controller.dart';
import 'package:ecommerce_task/model/item_model.dart';
import 'package:ecommerce_task/utils/constant/colors.dart';
import 'package:ecommerce_task/utils/constant/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({
    super.key,
    required this.productname,
    required this.image,
    required this.price,
  });

  final String productname;
  final String image;
  final int price;

  final PaymentController pcontroller = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.6,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15)),
              color: boxcolor2,
              image: DecorationImage(
                  image: AssetImage(image), fit: BoxFit.contain),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 30, left: 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    primarytxt(productname, 20),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 28,
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            primarytxt2("4.4", 18)
                          ],
                        ),
                        primarytxt2("₹${price.toString()}", 20)
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer")
                  ],
                ),
                GetBuilder<CartController>(
                  init: CartController(),
                  builder: (controller) {
                    return Row(
                      children: [
                        SizedBox(
                          height: 50,
                          width: 80,
                          child: ElevatedButton(
                            onPressed: () {
                              final ItemModel model =
                                  ItemModel(productname, image, price);
                             
                              controller.addtocart(model);
                              Get.showSnackbar(
                                const GetSnackBar(
                                  margin: EdgeInsets.all(15),
                                  snackStyle: SnackStyle.FLOATING,
                                  message: 'item added to cart',
                                  backgroundColor: Colors.green,
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white),
                            child: Icon(
                              Icons.shopping_cart_outlined,
                              color: buttoncolor,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                               
                                pcontroller.openPayment(price);
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: buttoncolor),
                              child: customtext(
                                  "Buy Now", Colors.white, 15, FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
