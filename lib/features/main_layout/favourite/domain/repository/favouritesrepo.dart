import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failures/failures.dart';
import 'package:ecommerce_app/features/main_layout/favourite/data/models/adddeletefavourite_model.dart';
import 'package:ecommerce_app/features/main_layout/favourite/data/models/favourite_model.dart';

abstract class FavouritesRepo {
  Future<Either<FavouriteModel, Failures>> getUserFavourites();
  Future<Either<AddDeleteFavouriteModel, Failures>> addProductFavourite(
      {required String productId});
  Future<Either<AddDeleteFavouriteModel, Failures>> deleteProductFavourite(
      {required String productId});
}
