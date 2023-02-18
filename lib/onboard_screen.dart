import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app_sample/cubit/app_cubit.dart';
import 'package:travel_app_sample/utils/app_colors.dart';
import 'package:travel_app_sample/utils/app_constants.dart';
import 'package:travel_app_sample/utils/app_dimensions.dart';
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
              TextButton(
                  onPressed: () {
                    BlocProvider.of<AppCubit>(context).getData();
                  },
                  child: Text('text')),
              Container(
                padding: EdgeInsets.only(
                    top: AppDimension.height40,
                    right: AppDimension.width20,
                    bottom: AppDimension.height20,
                    left: AppDimension.width20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppTitleText(
                        text: OnboardDataClass.onboardData[index].title),
                    Container(
                      margin: EdgeInsets.only(
                          top: AppDimension.height10,
                          bottom: AppDimension.height10),
                      width: AppDimension.height270,
                      child: AppText(
                          text:
                              OnboardDataClass.onboardData[index].description),
                    ),
                    AppButton(
                      buttonTitle: AppConstant.getStarted,
                      onPress: () {},
                    ),
                    Container(
                      width: AppDimension.height350,
                      height: AppDimension.height440,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              OnboardDataClass.onboardData[index].imageUrl),
                        ),
                      ),
                    ),
                    SizedBox(height: AppDimension.height20),
                  ],
                ),
              ),
              Row(
                children: List.generate(2, (dotIndex) {
                  return Container(
                    margin: EdgeInsets.all(AppDimension.width5),
                    width: AppDimension.width10,
                    height: AppDimension.height10,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(AppDimension.width5),
                        color: index == dotIndex
                            ? AppColors.appMainColor
                            : AppColors.appInactiveColor),
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
