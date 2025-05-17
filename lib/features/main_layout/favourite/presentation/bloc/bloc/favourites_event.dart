part of 'favourites_bloc.dart';

abstract class FavouritesEvent {}

class GetUserFavouritesEvent extends FavouritesEvent {}

class AddProductToFavouritesEvent extends FavouritesEvent {
  String productId;

  AddProductToFavouritesEvent(this.productId);
}

class DeleteProductFromFavouritesEvent extends FavouritesEvent {
  String productId;
  DeleteProductFromFavouritesEvent(this.productId);
}
