import 'package:flutter/material.dart';
import 'package:travel_app_sample/utils/app_colors.dart';
import 'package:travel_app_sample/utils/app_dimensions.dart';
import 'package:travel_app_sample/widgets/medium_text.dart';

class AppButton extends StatelessWidget {
  final String buttonTitle;
  final VoidCallback onPress;
  final double width;

  const AppButton(
      {Key? key,
      required this.buttonTitle,
      required this.onPress,
      this.width = AppDimension.zero})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimension.height30),
      ),
      width: width == AppDimension.zero ? AppDimension.height140 : width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: AppColors.appOrangeColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: onPress,
        child: AppMediumText(
          text: buttonTitle,
          size: AppDimension.width15,
        ),
      ),
    );
  }
}
