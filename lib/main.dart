import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travel_app_sample/cubit/app_cubit.dart';
import 'package:travel_app_sample/pages/detail_page.dart';
import 'package:travel_app_sample/pages/home_navigation_pages/main_home_page.dart';
import 'cubit/app_cubit_logic.dart';
import 'onboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (BuildContext context) => AppCubit(),
        child: AppCubitLogic(),),
    );
  }
}


