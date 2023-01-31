import 'package:flutter/material.dart';
import 'package:travel_app_sample/utils/app_dimensions.dart';

class AppText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;

  const AppText(
      {Key? key,
      required this.text,
      this.color = const Color(0xff707070),
      this.size = AppDimension.zero})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size == AppDimension.zero ? AppDimension.width10 : size,
        fontFamily: 'Poppins',
      ),
    );
  }
}
