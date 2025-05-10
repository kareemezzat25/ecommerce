import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/failures/failures.dart';
import 'package:ecommerce_app/features/auth/presentation/bloc/bloc/auth_bloc_bloc.dart';
import 'package:ecommerce_app/features/cart/data/models/cartresponse.dart';
import 'package:ecommerce_app/features/cart/domain/usecases/addtocart_usecase.dart';
import 'package:ecommerce_app/features/cart/domain/usecases/getcartproducts_usecase.dart';
import 'package:ecommerce_app/features/cart/domain/usecases/removeproductfromcart_usecase.dart';
import 'package:injectable/injectable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

@injectable
class CartBloc extends Bloc<CartEvent, CartState> {
  AddToCartUseCase addToCartUseCase;
  GetCartProductsUseCase getCartProductsUseCase;
  RemoveProductFromCartUseCase removeProductFromCartUseCase;
  CartBloc(this.addToCartUseCase, this.getCartProductsUseCase,
      this.removeProductFromCartUseCase)
      : super(CartInitial()) {
    on<CartEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<AddToCartEvent>((event, emit) async {
      emit(state.copyWith(addToCartRequestState: RequestState.loading));
      var result = await addToCartUseCase.call(productId: event.productId);
      result.fold((model) {
        emit(state.copyWith(
            addToCartRequestState: RequestState.success,
            addToCartResponseModel: model));
      }, (error) {
        emit(state.copyWith(
            addToCartRequestState: RequestState.error,
            addToCartFailures: error));
      });
    });
    on<GetCartProductsEvent>((event, emit) async {
      emit(state.copyWith(getCartProductsRequestState: RequestState.loading));

      var result = await getCartProductsUseCase.call();
      result.fold((model) {
        emit(state.copyWith(
            getCartProductsRequestState: RequestState.success,
            getCartProductsResponseModel: model));
      }, (error) {
        emit(state.copyWith(
            getCartProductsRequestState: RequestState.error,
            getCartProductsFailure: error));
      });
    });
    on<RemoveProductCartEvent>((event, emit) async {
      emit(state.copyWith(removeProductCartRequestState: RequestState.loading));

      var result =
          await removeProductFromCartUseCase.call(productId: event.productId);

      result.fold((model) {
        emit(state.copyWith(
            removeProductCartRequestState: RequestState.success,
            removeProductCartResponseModel: model));
        add(GetCartProductsEvent());
      }, (error) {
        emit(state.copyWith(
            removeProductCartRequestState: RequestState.error,
            removeProductCartFailures: error));
      });
    });
  }
}
