import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failures/failures.dart';
import 'package:ecommerce_app/core/failures/remotefailures.dart';
import 'package:ecommerce_app/features/main_layout/favourite/data/datasources/remote/favouritesremoteds.dart';
import 'package:ecommerce_app/features/main_layout/favourite/data/models/favourite_model.dart';
import 'package:ecommerce_app/features/main_layout/favourite/domain/repository/favouritesrepo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: FavouritesRepo)
class FavouritesRepoImpl extends FavouritesRepo {
  FavouritesRemoteDs favouritesRemoteDs;
  FavouritesRepoImpl(this.favouritesRemoteDs);

  @override
  Future<Either<FavouriteModel, Failures>> getUserFavourites() async {
    try {
      var result = await favouritesRemoteDs.getUserFavourites();
      return Left(result);
    } catch (e) {
      return Right(RemoteFailures(
          "SomeThing Went Wrong When Fetch Data of Your Favourites"));
    }
  }
}
