import 'package:ecommerce_task/controller/cart_controllerd.dart';
import 'package:ecommerce_task/view/view_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(){
  Get.put(CartController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'E_Commerce App',
      theme: ThemeData(
        useMaterial3: true,
      ),
     home: const HomeScreen(),
     debugShowCheckedModeBanner: false,
    );
  }
}