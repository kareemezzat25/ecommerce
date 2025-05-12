part of 'favourites_bloc.dart';

class FavouritesState {
  RequestState? getUserFavouritesRequestState;
  FavouriteModel? getUserFavouriteModel;
  Failures? getUserFavouriteFailures;

  FavouritesState(
      {this.getUserFavouritesRequestState,
      this.getUserFavouriteModel,
      this.getUserFavouriteFailures});

  copywith(
      {RequestState? getUserFavouritesRequestState,
      FavouriteModel? getUserFavouriteModel,
      Failures? getUserFavouriteFailures}) {
    return FavouritesState(
        getUserFavouritesRequestState:
            getUserFavouritesRequestState ?? this.getUserFavouritesRequestState,
        getUserFavouriteModel:
            getUserFavouriteModel ?? this.getUserFavouriteModel,
        getUserFavouriteFailures:
            getUserFavouriteFailures ?? this.getUserFavouriteFailures);
  }
}

final class FavouritesInitial extends FavouritesState {
  FavouritesInitial() : super(getUserFavouritesRequestState: RequestState.init);
}
