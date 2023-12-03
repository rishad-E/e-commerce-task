
import 'package:ecommerce_task/utils/constant/colors.dart';
import 'package:ecommerce_task/utils/constant/products.dart';
import 'package:ecommerce_task/utils/constant/texts.dart';
import 'package:ecommerce_task/view/cart_screen.dart';
import 'package:ecommerce_task/view/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          headingtxt("Discover"),
          const SizedBox(
            height: 1,
          ),
          customtext("Find everuthing you need",
              const Color.fromARGB(255, 126, 126, 126), 13, FontWeight.w400)
        ]),
        actions: [
          IconButton(
              onPressed: () {
                // Get.to( CartScreen());
                Get.to(()=>CartScreen());
              },
              icon: const Icon(Icons.shopping_cart_outlined))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            height: 140,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 222, 211, 203),
                image: DecorationImage(
                    image: AssetImage('assets/images/discount.png'),
                    fit: BoxFit.fill),
                borderRadius: BorderRadius.all(Radius.circular(15))),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 11),
            child: headingtxt2("Flash sales"),
          ),
          SizedBox(
            height: 190, 
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: flashsaleitem.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 4, right: 10),
                  child: InkWell(
                    onTap: () {
                      Get.to(DetailsScreen(
                        productname: flashsaleitem[index].name,
                        image: flashsaleitem[index].image,
                        price: flashsaleitem[index].price,
                      ));
                    },
                    child: SizedBox(
                      height: 150,
                      width: 130,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 140,
                            decoration: BoxDecoration(
                                color: boxcolor1,
                                image: DecorationImage(
                                    image:
                                        AssetImage(flashsaleitem[index].image),
                                    fit: BoxFit.cover),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(15))),
                          ),
                          const SizedBox(
                            height: 1,
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                primarytxt(flashsaleitem[index].name, 14),
                                primarytxt2(
                                    '₹${flashsaleitem[index].price.toString()}',
                                    15)
                              ])
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: headingtxt2("All items"),
              ),
              const Text(
                "view all",
                style: TextStyle(
                    color: Color.fromARGB(255, 109, 109, 109),
                    fontSize: 13),
              )
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          Expanded(   
            child: GridView.builder(
              itemCount: allitems.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisExtent: 210,
              mainAxisSpacing: 10),
              itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Get.to(DetailsScreen(
                  productname: allitems[index].name,
                  image: allitems[index].image,
                  price: allitems[index].price,
                ));
              },
              child: SizedBox(
                width: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 165,
                      decoration: BoxDecoration(
                          color: boxcolor2,
                          image: DecorationImage(
                              image: AssetImage(allitems[index].image),
                              fit: BoxFit.cover),
                          borderRadius: const BorderRadius.all(
                              Radius.circular(15))),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        primarytxt(allitems[index].name, 14),
                        primarytxt2(
                            '₹${allitems[index].price.toString()}', 15)
                      ],
                    )
                  ],
                ),
              ),
            );
              },
            ),
          )
        ]),
      ),
    );
  }
}
