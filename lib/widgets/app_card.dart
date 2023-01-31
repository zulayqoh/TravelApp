import 'package:flutter/material.dart';
import 'package:travel_app_sample/utils/app_dimensions.dart';

import '../utils/app_colors.dart';
import 'app_text.dart';
import 'medium_text.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppDimension.width20, vertical: AppDimension.height5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimension.width10),
        boxShadow: [BoxShadow(color: Colors.black12, offset: Offset(1, 3), blurRadius: AppDimension.width5),],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: AppDimension.height120,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/park1.png'),
                      fit: BoxFit.fill
                  ),
                ),
              ),
              Positioned(
                top: AppDimension.zero,
                right: AppDimension.zero,
                child: Container(
                  height: AppDimension.height30,
                  width: AppDimension.height30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(AppDimension.width10)),
                    color: AppColors.appOrangeColor,
                  ),
                  child: Icon(Icons.bookmark_add_outlined, color: Colors.white, size: 17),
                ),
              ),
              Positioned(
                bottom: AppDimension.zero,
                left: AppDimension.zero,
                right: AppDimension.zero,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: AppDimension.width10),
                  width: double.maxFinite,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 3),
                      AppMediumText(text: 'Banff National Park', color: Colors.black, size: 14),
                      AppText(text: 'Canada', size: 11),
                      SizedBox(height: 3),
                    ],
                  ),
                ),
              )
            ],
          ),

        ],
      ),
    );
  }
}