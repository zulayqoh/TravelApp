import 'package:flutter/material.dart';
import 'package:travel_app_sample/utils/app_colors.dart';
import 'package:travel_app_sample/utils/app_constants.dart';
import 'package:travel_app_sample/utils/app_dimensions.dart';

class SemiBoldText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;

  const SemiBoldText(
      {Key? key,
      required this.text,
      this.color = AppColors.appOrangeColor,
      this.size = AppDimension.zero})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: size == AppDimension.zero ? AppDimension.font33 : size,
          fontFamily: AppConstant.poppins,
          fontWeight: FontWeight.w600),
    );
  }
}
