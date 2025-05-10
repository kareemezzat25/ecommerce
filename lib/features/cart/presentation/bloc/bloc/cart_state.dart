part of 'cart_bloc.dart';

class CartState {
  RequestState? addToCartRequestState;
  RequestState? getCartProductsRequestState;
  RequestState? removeProductCartRequestState;
  CartResponseModel? addToCartResponseModel;
  CartResponseModel? getCartProductsResponseModel;
  CartResponseModel? removeProductCartResponseModel;
  Failures? addToCartFailures;
  Failures? getCartProductsFailure;
  Failures? removeProductCartFailures;

  CartState(
      {this.getCartProductsRequestState,
      this.removeProductCartRequestState,
      this.addToCartRequestState,
      this.addToCartResponseModel,
      this.getCartProductsResponseModel,
      this.removeProductCartResponseModel,
      this.addToCartFailures,
      this.getCartProductsFailure,
      this.removeProductCartFailures});
  CartState copyWith(
      {RequestState? addToCartRequestState,
      RequestState? getCartProductsRequestState,
      RequestState? removeProductCartRequestState,
      CartResponseModel? addToCartResponseModel,
      CartResponseModel? getCartProductsResponseModel,
      CartResponseModel? removeProductCartResponseModel,
      Failures? addToCartFailures,
      Failures? getCartProductsFailure,
      Failures? removeProductCartFailures}) {
    return CartState(
        addToCartRequestState:
            addToCartRequestState ?? this.addToCartRequestState,
        getCartProductsRequestState:
            getCartProductsRequestState ?? this.getCartProductsRequestState,
        removeProductCartRequestState:
            removeProductCartRequestState ?? this.removeProductCartRequestState,
        addToCartResponseModel:
            addToCartResponseModel ?? this.addToCartResponseModel,
        getCartProductsResponseModel:
            getCartProductsResponseModel ?? this.getCartProductsResponseModel,
        removeProductCartResponseModel: removeProductCartResponseModel ??
            this.removeProductCartResponseModel,
        addToCartFailures: addToCartFailures ?? this.addToCartFailures,
        getCartProductsFailure:
            getCartProductsFailure ?? this.getCartProductsFailure,
        removeProductCartFailures:
            removeProductCartFailures ?? this.removeProductCartFailures);
  }
}

final class CartInitial extends CartState {
  CartInitial()
      : super(
            addToCartRequestState: RequestState.init,
            getCartProductsRequestState: RequestState.init,
            removeProductCartRequestState: RequestState.init);
}
