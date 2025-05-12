import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failures/failures.dart';
import 'package:ecommerce_app/features/main_layout/favourite/data/models/favourite_model.dart';
import 'package:ecommerce_app/features/main_layout/favourite/domain/repository/favouritesrepo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetFavouritesUseCase {
  FavouritesRepo favouritesRepo;

  GetFavouritesUseCase(this.favouritesRepo);
  Future<Either<FavouriteModel, Failures>> call() {
    return favouritesRepo.getUserFavourites();
  }
}
