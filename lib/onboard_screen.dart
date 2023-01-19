import 'package:flutter/material.dart';
import 'package:travel_app_sample/utils/app_color.dart';
import 'package:travel_app_sample/utils/constants.dart';
import 'package:travel_app_sample/widgets/app_button.dart';
import 'package:travel_app_sample/widgets/app_text.dart';
import 'package:travel_app_sample/widgets/app_title_text.dart';

import 'onboard_data_class.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: OnboardDataClass.onboardData.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Container(
                padding:
                EdgeInsets.only(top: 50, right: 20, bottom: 20, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppTitleText(
                        text: OnboardDataClass.onboardData[index].title),
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      width: 250,
                      child: AppText(
                          text:
                          OnboardDataClass.onboardData[index].description),
                    ),
                    AppButton(
                      buttonTitle: AppConstant.getStarted,
                      onPress: () {},
                    ),
                    Container(
                      width: 350,
                      height: 450,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              OnboardDataClass.onboardData[index].imageUrl),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),
              Row(
                children: List.generate(2, (dotIndex) {
                  return Container(
                    margin: EdgeInsets.all(5),
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: index == dotIndex
                            ? AppColor.appMainColor
                            : AppColor.appInactiveColor),
                  );
                }),
              )
            ],
          );
        },
      ),
    );
  }
}