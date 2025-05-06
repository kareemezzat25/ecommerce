part of 'categories_bloc_bloc.dart';

class CategoriesBlocState {
  RequestState? categoriesRequestState;
  CategoriesModel? categoriesModel;
  Failures? categoriesFailures;

  CategoriesBlocState(
      {this.categoriesRequestState,
      this.categoriesModel,
      this.categoriesFailures});

  CategoriesBlocState copyWith(
      {RequestState? categoriesRequestState,
      CategoriesModel? categoriesModel,
      Failures? categoriesFailures}) {
    return CategoriesBlocState(
        categoriesRequestState:
            categoriesRequestState ?? this.categoriesRequestState,
        categoriesModel: categoriesModel ?? this.categoriesModel,
        categoriesFailures: categoriesFailures ?? this.categoriesFailures);
  }
}

final class CategoriesBlocInitial extends CategoriesBlocState {
  CategoriesBlocInitial() : super(categoriesRequestState: RequestState.init);
}
