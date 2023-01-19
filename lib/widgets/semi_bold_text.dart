import 'package:flutter/material.dart';
import 'package:travel_app_sample/utils/app_color.dart';

class SemiBoldText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;

  const SemiBoldText(
      {Key? key,
        required this.text,
        this.color = AppColor.appOrangeColor,
        this.size = 33.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: size,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600
      ),
    );
  }
}