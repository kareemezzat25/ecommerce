part of 'categories_bloc_bloc.dart';

class CategoriesBlocState {
  RequestState? categoriesRequestState;
  RequestState? subCategoriesOnCategoryRequestState;
  CategoriesModel? categoriesModel;
  CategoriesModel? subCategoriesOnCategoryModel;
  Failures? subCategoriesOnCategoryFailures;
  Failures? categoriesFailures;
  int? selectedIndex;

  CategoriesBlocState(
      {this.categoriesRequestState,
      this.subCategoriesOnCategoryRequestState,
      this.subCategoriesOnCategoryModel,
      this.categoriesModel,
      this.subCategoriesOnCategoryFailures,
      this.categoriesFailures,
      this.selectedIndex});

  CategoriesBlocState copyWith(
      {RequestState? categoriesRequestState,
      RequestState? subCategoriesOnCategoryRequestState,
      CategoriesModel? categoriesModel,
      CategoriesModel? subCategoriesOnCategoryModel,
      Failures? subCategoriesOnCategoryFailures,
      int? selectedIndex,
      Failures? categoriesFailures}) {
    return CategoriesBlocState(
        categoriesRequestState:
            categoriesRequestState ?? this.categoriesRequestState,
        subCategoriesOnCategoryRequestState:
            subCategoriesOnCategoryRequestState ??
                this.subCategoriesOnCategoryRequestState,
        categoriesModel: categoriesModel ?? this.categoriesModel,
        subCategoriesOnCategoryModel:
            subCategoriesOnCategoryModel ?? this.subCategoriesOnCategoryModel,
        categoriesFailures: categoriesFailures ?? this.categoriesFailures,
        subCategoriesOnCategoryFailures: subCategoriesOnCategoryFailures ??
            this.subCategoriesOnCategoryFailures,
        selectedIndex: selectedIndex ?? this.selectedIndex);
  }
}

final class CategoriesBlocInitial extends CategoriesBlocState {
  CategoriesBlocInitial()
      : super(
            categoriesRequestState: RequestState.init,
            subCategoriesOnCategoryRequestState: RequestState.init,
            selectedIndex: 0);
}
