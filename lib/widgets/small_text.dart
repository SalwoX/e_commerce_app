import 'package:e_commerce_app/utils/colors.dart';
import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final Color color;
  final String text;
  final TextOverflow overflow;
  double size;
  double height;

  SmallText({
    Key? key, this.color = const Color(0xFF89dad0),
    required this.text,
    this.overflow = TextOverflow.ellipsis,
    this.size = 12,
    this.height = 1.2
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        overflow: overflow,
        fontFamily: 'Roboto',
        color: color,
        fontSize: size,
        height: height,
      ),
    );
  }
}
