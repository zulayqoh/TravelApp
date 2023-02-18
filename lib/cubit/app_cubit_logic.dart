import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app_sample/cubit/app_cubit.dart';
import 'package:travel_app_sample/cubit/app_cubit_state.dart';
import 'package:travel_app_sample/onboard_screen.dart';
import 'package:travel_app_sample/pages/detail_page.dart';
import 'package:travel_app_sample/pages/home_navigation_pages/home_page.dart';

import '../pages/home_navigation_pages/main_home_page.dart';

class AppCubitLogic extends StatefulWidget {
  const AppCubitLogic({Key? key}) : super(key: key);

  @override
  State<AppCubitLogic> createState() => _AppCubitLogicState();
}

class _AppCubitLogicState extends State<AppCubitLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubit, AppCubitState>(builder: (context, state) {
        if (state is OnboardState) {
          return OnboardScreen();
        }
        if (state is LoadingState) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is LoadedState) {
          return HomePage();
        }
        if (state is DetailState) {
          return DetailPage();
        } else {
          return Container();
        }
      }),
    );
  }
}
