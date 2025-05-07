part of 'categories_bloc_bloc.dart';

abstract class CategoriesBlocEvent {}

class GetCategoriesEvent extends CategoriesBlocEvent {}

class GetSubCategoriesOnCategoryEvent extends CategoriesBlocEvent {
  String id;
  GetSubCategoriesOnCategoryEvent(this.id);
}

class ChangeSelectedIndex extends CategoriesBlocEvent {
  int index;
  ChangeSelectedIndex(this.index);
}

class GetSpecificCategory extends CategoriesBlocEvent {
  String id;
  GetSpecificCategory(this.id);
}
