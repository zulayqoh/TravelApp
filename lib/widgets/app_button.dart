import 'package:flutter/material.dart';
import 'package:travel_app_sample/utils/app_color.dart';
import 'package:travel_app_sample/widgets/medium_text.dart';

class AppButton extends StatelessWidget {
  final String buttonTitle;
  final VoidCallback onPress;
  final double width;

  const AppButton({Key? key, required this.buttonTitle, required this.onPress, this.width = 150}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: AppColor.appOrangeColor, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
        onPressed: onPress,
        child: AppMediumText(
          text: buttonTitle,
          size: 15,
        ),
      ),
    );
  }
}
