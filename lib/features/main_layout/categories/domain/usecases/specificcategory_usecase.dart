import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failures/failures.dart';
import 'package:ecommerce_app/features/main_layout/categories/data/models/specificCategorymodel.dart';
import 'package:ecommerce_app/features/main_layout/categories/domain/repository/subcategoriesrepo.dart';
import 'package:injectable/injectable.dart';

@injectable
class SpecificCategoryUseCase {
  SubCategoriesRepo subCategoriesRepo;
  SpecificCategoryUseCase(this.subCategoriesRepo);
  Future<Either<SpecificCategoryModel, Failures>> call(String id) async {
    return await subCategoriesRepo.getSpecificCategory(id: id);
  }
}
