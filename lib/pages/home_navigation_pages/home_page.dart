import 'package:flutter/material.dart';
import 'package:travel_app_sample/utils/app_colors.dart';
import 'package:travel_app_sample/utils/app_dimensions.dart';
import 'package:travel_app_sample/widgets/medium_text.dart';
import 'package:travel_app_sample/widgets/semi_bold_text.dart';

import '../../widgets/app_search_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: AppDimension.height40,
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
                bottom: AppDimension.height10,
                left: AppDimension.width20,
                right: AppDimension.width20),
            child: Row(
              children: [
                Icon(
                  Icons.menu,
                  color: AppColors.appMainColor,
                  size: AppDimension.font33,
                ),
                Expanded(child: SizedBox()),
                SemiBoldText(
                  text: 'Home',
                  color: AppColors.appMainColor,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: AppDimension.width20,
                right: AppDimension.width20,
                bottom: AppDimension.height20),
            child: AppSearchBox(),
          ),
          Divider(height: 2, color: AppColors.appSearchHintColor),
          Container(
            margin: EdgeInsets.symmetric(horizontal: AppDimension.height20, vertical: AppDimension.width10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppMediumText(
                  text: 'Show post',
                  color: Colors.black,
                  size: AppDimension.width15,
                ),
                Icon(Icons.arrow_forward_ios, size: AppDimension.height20)
              ],
            ),
          ),
          Divider(height: 2, color: AppColors.appSearchHintColor),
        ],
      ),
    );
  }
}
