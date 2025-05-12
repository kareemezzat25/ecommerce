import 'package:ecommerce_app/features/main_layout/favourite/data/models/favourite_model.dart';

abstract class FavouritesRemoteDs {
  Future<FavouriteModel> getUserFavourites();
}
