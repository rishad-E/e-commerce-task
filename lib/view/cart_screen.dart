import 'dart:developer';

import 'package:ecommerce_task/controller/cart_controllerd.dart';
import 'package:ecommerce_task/controller/payment_controller.dart';
import 'package:ecommerce_task/utils/constant/colors.dart';
import 'package:ecommerce_task/utils/constant/texts.dart';
import 'package:ecommerce_task/utils/widgets/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
   CartScreen({super.key});
  final PaymentController pcontroller = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: headingtxt("My Cart"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
        child: Column(children: [
          Expanded(
            child: GetBuilder<CartController>(
              init: CartController(),
              builder: (controller) {
              
                if (controller.cartitem.isEmpty) {
                  return Center(
                    child: primarytxt("No items", 14),
                  );
                } else {
                  return ListView.builder(
                    itemCount: controller.cartitem.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Container(
                          width: double.infinity,
                          height: 110,
                          decoration: BoxDecoration(
                              color: boxcolor1,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15))),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: double.infinity,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(15)),
                                          color: boxcolor2,
                                          image: DecorationImage(
                                              image: AssetImage(controller
                                                  .cartitem[index].image))),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        primarytxt2(
                                            controller.cartitem[index].name,
                                            16),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        primarytxt(
                                            "₹${controller.cartitem[index].price.toString()}",
                                            17)
                                      ],
                                    ),
                                  ],
                                ),
                                IconButton(
                                  onPressed: () {
                                    controller.removecart(index);
                                    Get.showSnackbar(
                                      const GetSnackBar(
                                        snackStyle: SnackStyle.FLOATING,
                                        message: 'item removed from cart',
                                        backgroundColor: Colors.red,
                                        duration: Duration(seconds: 2),
                                      ),
                                    );
                                  },
                                  icon: const Icon(Icons.remove_circle),
                                  color: buttoncolor,
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
          GetBuilder<CartController>(
            init: CartController(),
            builder: (controller) {
              return SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    if (controller.cartitem.isEmpty) {
                      return;
                    } else {
                      await controller.calculation();
                      Get.bottomSheet(bottomsheetcontainer(
                         item:  controller.cartitem.length,price:  controller.total,pcontroller:  pcontroller));
                    }
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: buttoncolor),
                  child:
                      customtext("Checkout", Colors.white, 15, FontWeight.bold),
                ),
              );
            },
          )
        ]),
      ),
    );
  }
}
