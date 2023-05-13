import 'package:flutter/material.dart';
import 'package:flutter_pvfoodservice/pages/home/food_page_body.dart';

import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
                top: Dimensions.height45, bottom: Dimensions.height15),
            padding: EdgeInsets.only(
                left: Dimensions.width20, right: Dimensions.width20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const BigText(
                      text: "Ho Chi Minh",
                      color: AppColors.mainColor,
                    ),
                    Row(
                      children: const [
                        SmallText(
                          text: "Viet Nam",
                          color: Colors.black54,
                        ),
                        Icon(Icons.arrow_drop_down_rounded)
                      ],
                    )
                  ],
                ),
                Center(
                  child: Container(
                    width: Dimensions.width45,
                    height: Dimensions.height45,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius15),
                        color: AppColors.mainColor),
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: Dimensions.icon24,
                    ),
                  ),
                )
              ],
            ),
          ),
          const Expanded(
              child: SingleChildScrollView(
            child: FoodPageBody(),
          ))
        ],
      ),
    );
  }
}
