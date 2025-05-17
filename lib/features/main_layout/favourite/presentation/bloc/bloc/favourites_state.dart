part of 'favourites_bloc.dart';

class FavouritesState {
  RequestState? getUserFavouritesRequestState;
  RequestState? addProductToFavouriteRequestState;
  RequestState? deleteProductFromFavouritesRequestState;
  FavouriteModel? getUserFavouriteModel;

  AddDeleteFavouriteModel? addProductToFavouritesModel;
  AddDeleteFavouriteModel? deleteProductFromFavouritesModel;
  Failures? getUserFavouriteFailures;
  Failures? addProductToFavouritesFailures;
  Failures? deleteProductFromFavouritesFailures;

  FavouritesState(
      {this.getUserFavouritesRequestState,
      this.addProductToFavouriteRequestState,
      this.deleteProductFromFavouritesRequestState,
      this.getUserFavouriteModel,
      this.addProductToFavouritesModel,
      this.deleteProductFromFavouritesModel,
      this.getUserFavouriteFailures,
      this.addProductToFavouritesFailures,
      this.deleteProductFromFavouritesFailures});

  copywith(
      {RequestState? getUserFavouritesRequestState,
      RequestState? addProductToFavouriteRequestState,
      RequestState? deleteProductFromFavouritesRequestState,
      FavouriteModel? getUserFavouriteModel,
      AddDeleteFavouriteModel? addProductToFavouritesModel,
      AddDeleteFavouriteModel? deleteProductFromFavouritesModel,
      Failures? getUserFavouriteFailures,
      Failures? addProductToFavouritesFailures,
      Failures? deleteProductFromFavouritesFailures}) {
    return FavouritesState(
        getUserFavouritesRequestState:
            getUserFavouritesRequestState ?? this.getUserFavouritesRequestState,
        addProductToFavouriteRequestState: addProductToFavouriteRequestState ??
            this.addProductToFavouriteRequestState,
        deleteProductFromFavouritesRequestState:
            deleteProductFromFavouritesRequestState ??
                this.deleteProductFromFavouritesRequestState,
        getUserFavouriteModel:
            getUserFavouriteModel ?? this.getUserFavouriteModel,
        addProductToFavouritesModel:
            addProductToFavouritesModel ?? this.addProductToFavouritesModel,
        deleteProductFromFavouritesModel: deleteProductFromFavouritesModel ??
            this.deleteProductFromFavouritesModel,
        getUserFavouriteFailures:
            getUserFavouriteFailures ?? this.getUserFavouriteFailures,
        addProductToFavouritesFailures: addProductToFavouritesFailures ??
            this.addProductToFavouritesFailures,
        deleteProductFromFavouritesFailures:
            deleteProductFromFavouritesFailures ??
                this.deleteProductFromFavouritesFailures);
  }
}

final class FavouritesInitial extends FavouritesState {
  FavouritesInitial()
      : super(
            getUserFavouritesRequestState: RequestState.init,
            addProductToFavouriteRequestState: RequestState.init,
            deleteProductFromFavouritesRequestState: RequestState.init);
}
