import 'package:flutter/material.dart';
import 'package:travel_app_sample/custom_icons_icons.dart';
import 'package:travel_app_sample/utils/app_colors.dart';
import 'package:travel_app_sample/utils/app_dimensions.dart';
import 'package:travel_app_sample/widgets/app_text.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              child: Image(
                image: AssetImage('assets/images/bali.png'),
              ),
            ),
            Positioned(
              top: 50,
              left: 20,
              right: 20,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.menu, color: AppColors.appMainColor, size: 30),
                    Icon(Icons.more_vert,
                        color: AppColors.appMainColor, size: 30),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: AppDimension.zero,
              right: AppDimension.zero,
              left: AppDimension.zero,
              child: Container(
                padding: EdgeInsets.only(
                    top: AppDimension.height20,
                    left: AppDimension.width20,
                    right: AppDimension.width20),
                width: double.maxFinite,
                height: AppDimension.screenHeight * .66,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(AppDimension.width25),
                        topLeft: Radius.circular(AppDimension.width25))),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(text: 'Bali, Indonesia', size: 20, color: Colors.black,),
                        Icon(CustomIcons.bookmark, size: 21),
                      ],
                    ),
                    SizedBox(height: AppDimension.height5),
                    AppText(text: 'Etiam facilisis ligula nec velit posuere egestas. Nunc dictum lectus sem, vel dignissim purus luctus quis. Vestibulum et ligula suscipit, hendre rit erat a, ultricies velit. Praesent convallis in lorem nec blandit. Phasellus a porta tellus. Suspenisse sagittis metus enim.', size: 13)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
