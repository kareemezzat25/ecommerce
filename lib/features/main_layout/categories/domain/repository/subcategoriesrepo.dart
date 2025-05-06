import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failures/failures.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/categories_model.dart';

abstract class SubCategoriesRepo {
  Future<Either<CategoriesModel, Failures>> getAllSubCategoriesOnCatgeory(
      {required String id});
}
