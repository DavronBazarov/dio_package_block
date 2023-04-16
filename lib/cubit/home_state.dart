import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:dio_package/model/user_model.dart';
import 'package:dio_package/service/get_user_service.dart';
import 'package:equatable/equatable.dart';

part 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HomeInitialState extends HomeState{
  const HomeInitialState();
}

class HomeLoadingState extends HomeState{
  const HomeLoadingState();
}

class HomeSuccessState extends HomeState{
  List<UserModel> data;
  HomeSuccessState(this.data);
}

class HomeErrorState extends HomeState{
  String error;
  HomeErrorState(this.error);
}
