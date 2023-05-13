import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pvfoodservice/utils/colors.dart';
import 'package:flutter_pvfoodservice/widgets/big_text.dart';
import 'package:flutter_pvfoodservice/widgets/hour_and_text.dart';

import '../../utils/dimensions.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = Dimensions.pageViewContainer;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: Dimensions.pageView,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              }),
        ),
        DotsIndicator(
          dotsCount: 5,
          position: _currPageValue.toInt(),
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
        SizedBox(height: Dimensions.height30),
        Container(
          margin: EdgeInsets.only(
              left: Dimensions.width30, bottom: Dimensions.height30),
          child: Row(
            children: [
              const BigText(text: "Popular"),
              SizedBox(width: Dimensions.width10),
            ],
          ),
        ),
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    bottom: Dimensions.height10),
                child: Row(
                  children: [
                    Container(
                      width: Dimensions.popularProductImageWidth,
                      height: Dimensions.popularProductImageHeight,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                          color: Colors.white38,
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/food1.png"))),
                    ),
                    Expanded(
                      child: Container(
                        height: Dimensions.popularProductContainerHeight,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(Dimensions.radius20),
                                bottomRight:
                                    Radius.circular(Dimensions.radius20)),
                            color: Colors.white),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: Dimensions.width10,
                              right: Dimensions.width10,
                              top: Dimensions.height15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BigText(
                                text: "Bacon, Egg & Cheese Biscuit",
                                overFlow: TextOverflow.ellipsis,
                                size: Dimensions.font15,
                              ),
                              SizedBox(
                                height: Dimensions.height10,
                              ),
                              BigText(
                                text: "\$18",
                                color: AppColors.mainColor,
                                size: Dimensions.font15,
                              ),
                              SizedBox(
                                height: Dimensions.height10,
                              ),
                              HourAndText(
                                icon: Icons.category_rounded,
                                iconSize: Dimensions.icon15,
                                iconColor: AppColors.yellowColor,
                                textHour: "Breakfast",
                                color: AppColors.textColor,
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            }),
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimensions.pageViewContainer,
            margin: const EdgeInsets.only(left: 5, right: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: index.isEven
                    ? const Color((0xFF69c5df))
                    : const Color(0xFF9294cc),
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/food4.jpg"))),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: Dimensions.pageViewTextContainerWidth,
              height: Dimensions.pageViewTextContainerHeight,
              margin: EdgeInsets.only(
                  left: Dimensions.width30,
                  right: Dimensions.width30,
                  bottom: Dimensions.height15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        color: Color(0xFFe8e8e8),
                        blurRadius: 5.0,
                        offset: Offset(0, 5)),
                    BoxShadow(color: Colors.white, offset: Offset(-5, 0))
                  ]),
              child: Container(
                padding: EdgeInsets.only(
                    top: Dimensions.height15,
                    left: Dimensions.width15,
                    right: Dimensions.width15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const BigText(text: "For Couple 129k"),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(
                              5,
                              (index) => Icon(
                                    Icons.star,
                                    color: AppColors.mainColor,
                                    size: Dimensions.height15,
                                  )),
                        )
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    const Divider(
                      color: AppColors.textColor,
                    ),
                    const HourAndText(
                        icon: Icons.access_time, textHour: "10:00 - 04:00")
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
