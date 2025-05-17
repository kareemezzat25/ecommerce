import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/failures/failures.dart';
import 'package:ecommerce_app/features/auth/presentation/bloc/bloc/auth_bloc_bloc.dart';
import 'package:ecommerce_app/features/main_layout/favourite/data/models/adddeletefavourite_model.dart';
import 'package:ecommerce_app/features/main_layout/favourite/data/models/favourite_model.dart';
import 'package:ecommerce_app/features/main_layout/favourite/domain/usecases/addproductfavourite_usecase.dart';
import 'package:ecommerce_app/features/main_layout/favourite/domain/usecases/deleteproductfavourite_usecase.dart';
import 'package:ecommerce_app/features/main_layout/favourite/domain/usecases/getfavourites_usecase.dart';
import 'package:injectable/injectable.dart';

part 'favourites_event.dart';
part 'favourites_state.dart';

@injectable
class FavouritesBloc extends Bloc<FavouritesEvent, FavouritesState> {
  GetFavouritesUseCase getFavouritesUseCase;
  AddProductFavouritesUseCase addProductFavouritesUseCase;
  DeleteProductFavouriteUseCase deleteProductFavouriteUseCase;
  FavouritesBloc(this.getFavouritesUseCase, this.addProductFavouritesUseCase,
      this.deleteProductFavouriteUseCase)
      : super(FavouritesInitial()) {
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
    on<AddProductToFavouritesEvent>((event, emit) async {
      emit(state.copywith(
          addProductToFavouriteRequestState: RequestState.loading));

      var result =
          await addProductFavouritesUseCase.call(productId: event.productId);

      result.fold((model) {
        emit(state.copywith(
            addProductToFavouriteRequestState: RequestState.success,
            addProductToFavouritesModel: model));
      }, (error) {
        emit(state.copywith(
            addProductToFavouriteRequestState: RequestState.error,
            addProductToFavouritesFailures: error));
      });
    });
    on<DeleteProductFromFavouritesEvent>((event, emit) async {
      emit(state.copywith(
          deleteProductFromFavouritesRequestState: RequestState.loading));

      var result =
          await deleteProductFavouriteUseCase.call(productId: event.productId);
      result.fold((model) {
        emit(state.copywith(
            deleteProductFromFavouritesRequestState: RequestState.success,
            deleteProductFromFavouritesModel: model));
      }, (error) {
        emit(state.copywith(
            deleteProductFromFavouritesRequestState: RequestState.error,
            deleteProductFromFavouritesFailures: error));
      });
    });
  }
}
