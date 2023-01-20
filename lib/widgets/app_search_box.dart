import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_constants.dart';
import '../utils/app_dimensions.dart';

class AppSearchBox extends StatelessWidget {
  const AppSearchBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorHeight: AppDimension.width25,
      cursorColor: AppColors.appMainColor,
      keyboardType: TextInputType.streetAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        hintText: 'Search',
        hintStyle: TextStyle(
            fontSize: AppDimension.font33/2,
            fontFamily: AppConstant.poppins,
            color: AppColors.appSearchHintColor),
        prefixIcon: Icon(
          Icons.search,
          size: AppDimension.font33,
          color: Colors.black,
        ),
        filled: true,
        fillColor: AppColors.appSearchFillColor,
      ),
    );
  }
}
