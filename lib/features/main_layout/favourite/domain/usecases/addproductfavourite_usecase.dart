import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failures/failures.dart';
import 'package:ecommerce_app/features/main_layout/favourite/data/models/adddeletefavourite_model.dart';
import 'package:ecommerce_app/features/main_layout/favourite/domain/repository/favouritesrepo.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddProductFavouritesUseCase {
  FavouritesRepo favouritesRepo;
  AddProductFavouritesUseCase(this.favouritesRepo);
  Future<Either<AddDeleteFavouriteModel, Failures>> call(
      {required String productId}) {
    return favouritesRepo.addProductFavourite(productId: productId);
  }
}
