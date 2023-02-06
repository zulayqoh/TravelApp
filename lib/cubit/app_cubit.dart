import 'package:bloc/bloc.dart';
import 'package:travel_app_sample/cubit/app_cubit_state.dart';

class AppCubit extends Cubit<AppCubitState> {
  // AppCubit(super.initialState);
  AppCubit(): super(InitialState()) {
    emit(OnboardState());
  }
}