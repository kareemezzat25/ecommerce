import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failures/failures.dart';
import 'package:ecommerce_app/features/main_layout/categories/domain/repository/subcategoriesrepo.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/categories_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class SubCategoriesUseCase {
  SubCategoriesRepo subCategoriesRepo;
  SubCategoriesUseCase(this.subCategoriesRepo);
  Future<Either<CategoriesModel, Failures>> call(String id) {
    return subCategoriesRepo.getAllSubCategoriesOnCatgeory(id: id);
  }
}
