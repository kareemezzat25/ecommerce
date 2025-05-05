import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failures/failures.dart';
import 'package:ecommerce_app/core/failures/remotefailures.dart';
import 'package:ecommerce_app/features/main_layout/home/data/datasources/remote/homeremote_ds.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/categories_model.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/repository/homerepo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepo)
class HomeRepoImpl extends HomeRepo {
  HomeRemoteDs homeRemoteDs;
  HomeRepoImpl(this.homeRemoteDs);
  @override
  Future<Either<CategoriesModel, Failures>> getCategories() async {
    try {
      var categories = await homeRemoteDs.getCategories();
      return Left(categories);
    } catch (e) {
      return Right(
          RemoteFailures("SomeThing went Wrong when i get Categories"));
    }
  }
}
