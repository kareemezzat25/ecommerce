part of 'home_bloc.dart';

class HomeState {
  RequestState? homeCatgeoriesState;
  CategoriesModel? categoriesModel;
  Failures? failures;

  HomeState({this.homeCatgeoriesState, this.categoriesModel, this.failures});

  HomeState copyWith(
      {RequestState? homeCategoriesState,
      CategoriesModel? categoriesModel,
      Failures? failures}) {
    return HomeState(
        homeCatgeoriesState: homeCategoriesState ?? this.homeCatgeoriesState,
        categoriesModel: categoriesModel ?? this.categoriesModel,
        failures: failures ?? this.failures);
  }
}

final class HomeInitial extends HomeState {
  HomeInitial() : super(homeCatgeoriesState: RequestState.init);
}
