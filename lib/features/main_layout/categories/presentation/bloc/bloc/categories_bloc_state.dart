part of 'categories_bloc_bloc.dart';

class CategoriesBlocState {
  RequestState? categoriesRequestState;
  RequestState? subCategoriesOnCategoryRequestState;
  RequestState? specificCategoryRequestState;
  CategoriesModel? categoriesModel;
  CategoriesModel? subCategoriesOnCategoryModel;
  SpecificCategoryModel? specificCategoryModel;
  Failures? subCategoriesOnCategoryFailures;
  Failures? categoriesFailures;
  Failures? specificCategoryFailures;
  int? selectedIndex;

  CategoriesBlocState(
      {this.categoriesRequestState,
      this.subCategoriesOnCategoryRequestState,
      this.specificCategoryRequestState,
      this.subCategoriesOnCategoryModel,
      this.categoriesModel,
      this.specificCategoryModel,
      this.subCategoriesOnCategoryFailures,
      this.categoriesFailures,
      this.specificCategoryFailures,
      this.selectedIndex});

  CategoriesBlocState copyWith({
    RequestState? categoriesRequestState,
    RequestState? subCategoriesOnCategoryRequestState,
    RequestState? specificCategoryRequestState,
    CategoriesModel? categoriesModel,
    CategoriesModel? subCategoriesOnCategoryModel,
    SpecificCategoryModel? specificCategoryModel,
    Failures? categoriesFailures,
    Failures? subCategoriesOnCategoryFailures,
    Failures? specificCategoryFailures,
    int? selectedIndex,
  }) {
    return CategoriesBlocState(
        categoriesRequestState:
            categoriesRequestState ?? this.categoriesRequestState,
        subCategoriesOnCategoryRequestState:
            subCategoriesOnCategoryRequestState ??
                this.subCategoriesOnCategoryRequestState,
        specificCategoryRequestState:
            specificCategoryRequestState ?? this.specificCategoryRequestState,
        categoriesModel: categoriesModel ?? this.categoriesModel,
        subCategoriesOnCategoryModel:
            subCategoriesOnCategoryModel ?? this.subCategoriesOnCategoryModel,
        specificCategoryModel:
            specificCategoryModel ?? this.specificCategoryModel,
        categoriesFailures: categoriesFailures ?? this.categoriesFailures,
        subCategoriesOnCategoryFailures: subCategoriesOnCategoryFailures ??
            this.subCategoriesOnCategoryFailures,
        specificCategoryFailures:
            specificCategoryFailures ?? this.specificCategoryFailures,
        selectedIndex: selectedIndex ?? this.selectedIndex);
  }
}

final class CategoriesBlocInitial extends CategoriesBlocState {
  CategoriesBlocInitial()
      : super(
            categoriesRequestState: RequestState.init,
            subCategoriesOnCategoryRequestState: RequestState.init,
            specificCategoryRequestState: RequestState.init,
            selectedIndex: 0);
}
