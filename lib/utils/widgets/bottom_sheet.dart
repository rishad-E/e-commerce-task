import 'dart:developer';

import 'package:ecommerce_task/controller/payment_controller.dart';
import 'package:ecommerce_task/utils/constant/colors.dart';
import 'package:ecommerce_task/utils/constant/texts.dart';
import 'package:flutter/material.dart';

Widget bottomsheetcontainer({
  required int item,
  required int price,
  required PaymentController pcontroller,
  String? pName,
}) {
  return Container(
    height: 170,
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(30, 25, 30, 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  primarytxt("No.of items", 17),
                  const SizedBox(
                    height: 4,
                  ),
                  primarytxt2(item.toString(), 20)
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  primarytxt("Total", 17),
                  const SizedBox(
                    height: 4,
                  ),
                  primarytxt2("₹${price.toString()}", 20)
                ],
              )
            ],
          ),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
               
                pcontroller.openPayment(price);
              },
              style: ElevatedButton.styleFrom(backgroundColor: buttoncolor),
              child: customtext(
                  "Continue Payment", Colors.white, 15, FontWeight.bold),
            ),
          )
        ],
      ),
    ),
  );
}
