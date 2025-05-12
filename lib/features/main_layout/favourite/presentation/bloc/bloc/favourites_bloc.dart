import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/failures/failures.dart';
import 'package:ecommerce_app/features/auth/presentation/bloc/bloc/auth_bloc_bloc.dart';
import 'package:ecommerce_app/features/main_layout/favourite/data/models/favourite_model.dart';
import 'package:ecommerce_app/features/main_layout/favourite/domain/usecases/getfavourites_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'favourites_event.dart';
part 'favourites_state.dart';

@injectable
class FavouritesBloc extends Bloc<FavouritesEvent, FavouritesState> {
  GetFavouritesUseCase getFavouritesUseCase;
  FavouritesBloc(this.getFavouritesUseCase) : super(FavouritesInitial()) {
    on<FavouritesEvent>((event, emit) {});
    on<GetUserFavouritesEvent>((event, emit) async {
      emit(state.copywith(getUserFavouritesRequestState: RequestState.loading));
      var result = await getFavouritesUseCase.call();

      result.fold((model) {
        emit(state.copywith(
            getUserFavouritesRequestState: RequestState.success,
            getUserFavouriteModel: model));
      }, (error) {
        emit(state.copywith(
            getUserFavouritesRequestState: RequestState.error,
            getUserFavouriteFailures: error));
      });
    });
  }
}
