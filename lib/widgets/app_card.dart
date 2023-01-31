import 'package:flutter/material.dart';

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
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.black12, offset: Offset(1, 3), blurRadius: 5),],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 120,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/park1.png'),
                      fit: BoxFit.fill
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(10)),
                    color: AppColors.appOrangeColor,
                  ),
                  child: Icon(Icons.bookmark_add_outlined, color: Colors.white, size: 17),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10),
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