import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travel_app_sample/app_model/example_model.dart';
import 'package:travel_app_sample/cubit/app_cubit.dart';
import 'package:travel_app_sample/cubit/app_cubit_state.dart';
import 'package:travel_app_sample/custom_icons_icons.dart';
import 'package:travel_app_sample/services/example_service.dart';
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
  void initState() {
    // TODO: implement initState
    // BlocProvider.of<AppCubit>(context).getData();
    //  ExampleService().getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubit, AppCubitState>(builder: (context, state) {
        state as DetailState;
        ExampleModel detail = state.detail;
        return SizedBox(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                top: AppDimension.zero,
                left: AppDimension.zero,
                right: AppDimension.zero,
                child: Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "http://mark.bslmeiyu.com/uploads/" + detail.img),
                ),
              ),
              Positioned(
                top: AppDimension.height40,
                left: AppDimension.width20,
                right: AppDimension.width20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        BlocProvider.of<AppCubit>(context).goHome();
                      },
                      icon: Icon(Icons.menu,
                          color: AppColors.appSearchFillColor, size: 30),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.more_vert,
                          color: AppColors.appSearchFillColor, size: 30),
                    )
                  ],
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
                  height: AppDimension.screenHeight*.67,
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
                          AppText(
                            text: detail.name,
                            size: 20,
                            color: Colors.black,
                          ),
                          Icon(CustomIcons.bookmark, size: 21),
                        ],
                      ),
                      SizedBox(height: AppDimension.height5),
                      AppText(
                          text:
                              'Etiam facilisis ligula nec velit posuere egestas. Nunc dictum lectus sem, vel dignissim purus luctus quis. Vestibulum et ligula suscipit, hendre rit erat a, ultricies velit. Praesent convallis in lorem nec blandit. Phasellus a porta tellus. Suspenisse sagittis metus enim.',
                          size: 13)
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
