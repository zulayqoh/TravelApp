import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app_sample/cubit/app_cubit.dart';
import 'package:travel_app_sample/cubit/app_cubit_state.dart';
import 'package:travel_app_sample/onboard_screen.dart';

class AppCubitLogic extends StatefulWidget {
  const AppCubitLogic({Key? key}) : super(key: key);

  @override
  State<AppCubitLogic> createState() => _AppCubitLogicState();
}

class _AppCubitLogicState extends State<AppCubitLogic> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppCubitState>(
        builder: (context, state) {
          if(state is  OnboardState) {
            return OnboardScreen ();
          } else {
            return Container();
          }
    });
  }
}
