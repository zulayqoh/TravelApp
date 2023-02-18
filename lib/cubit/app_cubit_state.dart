import 'package:equatable/equatable.dart';

import '../app_model/example_model.dart';

abstract class AppCubitState extends Equatable {}

class InitialState extends AppCubitState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OnboardState extends AppCubitState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadingState extends AppCubitState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadedState extends AppCubitState {
  LoadedState(this.exampleData);

  final List<ExampleModel> exampleData;

  @override
  // TODO: implement props
  List<Object?> get props => [exampleData];
}

class DetailState extends AppCubitState {
  DetailState(this.detail);

  final ExampleModel detail;

  @override
  // TODO: implement props
  List<Object?> get props => [detail];
}
