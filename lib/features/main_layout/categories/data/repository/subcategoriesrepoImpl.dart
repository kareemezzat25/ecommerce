import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failures/failures.dart';
import 'package:ecommerce_app/core/failures/remotefailures.dart';
import 'package:ecommerce_app/features/main_layout/categories/data/datasources/remote/categoriesremoteds.dart';
import 'package:ecommerce_app/features/main_layout/categories/domain/repository/subcategoriesrepo.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/categories_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SubCategoriesRepo)
class SubCategoriesRepoImpl extends SubCategoriesRepo {
  CategoriesRemoteDs categoriesRemoteDs;
  SubCategoriesRepoImpl(this.categoriesRemoteDs);
  @override
  Future<Either<CategoriesModel, Failures>> getAllSubCategoriesOnCatgeory(
      {required String id}) async {
    try {
      var result = await categoriesRemoteDs.getAllSubCategoriesOnCategory(id);
      return Left(result);
    } catch (e) {
      return Right(RemoteFailures(
          "SomeThing went Wrong when Fetch Data of SubCategories"));
    }
  }
}
