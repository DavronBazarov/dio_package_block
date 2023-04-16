part of 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeInitialState()){
    getUser();
  }

  // Logic ....

  void getUser() async {
    emit(const HomeLoadingState());
    await GetUserService.getUser().then((dynamic response) {
      if (response is Response) {
        List<UserModel> resData =
            (response.data as List).map((e) => UserModel.fromJson(e)).toList();
        emit(HomeSuccessState(resData));
      } else {
        emit(HomeErrorState(response));
      }
    });
  }
}
