import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failures/failures.dart';
import 'package:ecommerce_app/features/main_layout/categories/data/models/specificCategorymodel.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/categories_model.dart';

abstract class SubCategoriesRepo {
  Future<Either<CategoriesModel, Failures>> getAllSubCategoriesOnCatgeory(
      {required String id});
  Future<Either<SpecificCategoryModel, Failures>> getSpecificCategory(
      {required String id});
}
