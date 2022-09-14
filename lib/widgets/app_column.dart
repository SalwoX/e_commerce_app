import 'package:e_commerce_app/utils/utils.dart';
import 'package:e_commerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AppColumn extends StatelessWidget {
  final String text;

  const AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: Dimensions.height10),
        BigText(
          text: text,
          size: Dimensions.font26,
        ),
        SizedBox(height: Dimensions.height5),
     Row(
          children: [
            Wrap(
                children: List.generate(5, (index) {
              return Icon(Icons.star, color: AppColors.mainColor, size: 15);
            })),
            const SizedBox(width: 10),
            SmallText(text: "4.5"),
            const SizedBox(width: 10),
            SmallText(text: "1287"),
            const SizedBox(width: 10),
            SmallText(text: "comments"),
        ],
    ),
        SizedBox(height: Dimensions.height5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconsAndTextWidget(
              icon: Icons.circle_sharp,
              text: "Normal",
              iconColor: AppColors.iconColor1,
            ),
            IconsAndTextWidget(
              icon: Icons.location_on,
              text: "1.7km",
              iconColor: AppColors.mainColor,
            ),
            IconsAndTextWidget(
              icon: Icons.access_time_rounded,
              text: "32min",
              iconColor: AppColors.iconColor1,
            )
          ],
        )
      ]
      ,
    );
  }

}
