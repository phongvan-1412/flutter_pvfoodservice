import 'package:flutter/material.dart';
import 'package:flutter_pvfoodservice/pages/food/popular_food_detail.dart';
import 'package:flutter_pvfoodservice/pages/home/main_home_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'PV Food Service',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const MainHomePage(),
      home: const PopularFoodDetail(),
    );
  }
}
