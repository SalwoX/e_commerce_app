import 'package:e_commerce_app/pages/home/food_page_body.dart';
import 'package:e_commerce_app/utils/utils.dart';
import 'package:e_commerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
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
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Column(
                      children: [
                        BigText(
                            text: "Bangladesh",
                            color: AppColors.mainColor,
                            size: 0),
                        Row(
                          children: [
                            SmallText(
                                text: "Narshingdi", color: Colors.black54),
                            const Icon(Icons.arrow_drop_down_rounded),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                Center(
                  child: Container(
                    width: Dimensions.height45,
                    height: Dimensions.height45,
                    child: Icon(Icons.search,
                        color: Colors.white, size: Dimensions.iconSize24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius15),
                      color: AppColors.mainColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(child: FoodPageBody()),
        ),
      ],
    ));
  }
}
