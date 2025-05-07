import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failures/failures.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/categories_model.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/repository/homerepo.dart';
import 'package:injectable/injectable.dart';

@injectable
class CategoriesUsecase {
  HomeRepo homeRepo;
  CategoriesUsecase(this.homeRepo);

  Future<Either<CategoriesModel, Failures>> call() async {
    return await homeRepo.getCategories();
  }
}
