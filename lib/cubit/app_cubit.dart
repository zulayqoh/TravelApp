import 'package:bloc/bloc.dart';
import 'package:travel_app_sample/app_model/example_model.dart';
import 'package:travel_app_sample/cubit/app_cubit_state.dart';
import 'package:travel_app_sample/services/example_service.dart';

class AppCubit extends Cubit<AppCubitState> {
  // AppCubit(super.initialState);
  AppCubit({required this.dataService}) : super(InitialState()) {
    emit(OnboardState());
  }

  ExampleService dataService;
  late List<ExampleModel> responseData;

  Future<void> getData() async {
    try {
      emit(LoadingState());
      responseData = await dataService.getData();
      emit(LoadedState(responseData));
    } catch (e) {
      print(e);
    }
  }

  goToDetail(ExampleModel detailData) {
    emit(DetailState(detailData));
  }

  goHome() {
    emit(LoadedState(responseData));
  }
}
