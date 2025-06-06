import 'package:ecommerce_app/features/main_layout/favourite/data/models/adddeletefavourite_model.dart';
import 'package:ecommerce_app/features/main_layout/favourite/data/models/favourite_model.dart';

abstract class FavouritesRemoteDs {
  Future<FavouriteModel> getUserFavourites();
  Future<AddDeleteFavouriteModel> addProductFavourite(
      {required String productId});
  Future<AddDeleteFavouriteModel> deleteProductFavourite(
      {required String productId});
}
