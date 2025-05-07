import 'package:ecommerce_app/features/main_layout/categories/data/models/specificCategorymodel.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/categories_model.dart';

abstract class CategoriesRemoteDs {
  Future<CategoriesModel> getAllSubCategoriesOnCategory(String id);
  Future<SpecificCategoryModel> getSpecificCategory(String id);
}
