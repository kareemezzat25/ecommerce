part of 'favourites_bloc.dart';

class FavouritesState {
  RequestState? getUserFavouritesRequestState;
  RequestState? addProductToFavouriteRequestState;
  FavouriteModel? getUserFavouriteModel;
  AddDeleteFavouriteModel? addProductToFavouritesModel;
  Failures? getUserFavouriteFailures;
  Failures? addProductToFavouritesFailures;

  FavouritesState(
      {this.getUserFavouritesRequestState,
      this.addProductToFavouriteRequestState,
      this.getUserFavouriteModel,
      this.addProductToFavouritesModel,
      this.getUserFavouriteFailures,
      this.addProductToFavouritesFailures});

  copywith(
      {RequestState? getUserFavouritesRequestState,
      RequestState? addProductToFavouriteRequestState,
      FavouriteModel? getUserFavouriteModel,
      AddDeleteFavouriteModel? addProductToFavouritesModel,
      Failures? getUserFavouriteFailures,
      Failures? addProductToFavouritesFailures}) {
    return FavouritesState(
        getUserFavouritesRequestState:
            getUserFavouritesRequestState ?? this.getUserFavouritesRequestState,
        addProductToFavouriteRequestState: addProductToFavouriteRequestState ??
            this.addProductToFavouriteRequestState,
        getUserFavouriteModel:
            getUserFavouriteModel ?? this.getUserFavouriteModel,
        addProductToFavouritesModel:
            addProductToFavouritesModel ?? this.addProductToFavouritesModel,
        getUserFavouriteFailures:
            getUserFavouriteFailures ?? this.getUserFavouriteFailures,
        addProductToFavouritesFailures: addProductToFavouritesFailures ??
            this.addProductToFavouritesFailures);
  }
}

final class FavouritesInitial extends FavouritesState {
  FavouritesInitial()
      : super(
            getUserFavouritesRequestState: RequestState.init,
            addProductToFavouriteRequestState: RequestState.init);
}
