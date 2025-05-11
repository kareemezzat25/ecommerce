part of 'cart_bloc.dart';

class CartState {
  RequestState? addToCartRequestState;
  RequestState? getCartProductsRequestState;
  RequestState? removeProductCartRequestState;
  RequestState? removeCartRequestState;
  CartResponseModel? addToCartResponseModel;
  CartResponseModel? getCartProductsResponseModel;
  CartResponseModel? removeProductCartResponseModel;
  Map<String, dynamic>? removeCartResponse;
  Failures? addToCartFailures;
  Failures? getCartProductsFailure;
  Failures? removeProductCartFailures;
  Failures? removeCartFailures;

  CartState(
      {this.getCartProductsRequestState,
      this.removeProductCartRequestState,
      this.removeCartRequestState,
      this.addToCartRequestState,
      this.addToCartResponseModel,
      this.getCartProductsResponseModel,
      this.removeCartResponse,
      this.removeProductCartResponseModel,
      this.addToCartFailures,
      this.getCartProductsFailure,
      this.removeCartFailures,
      this.removeProductCartFailures});
  CartState copyWith(
      {RequestState? addToCartRequestState,
      RequestState? getCartProductsRequestState,
      RequestState? removeProductCartRequestState,
      RequestState? removeCartRequestState,
      CartResponseModel? addToCartResponseModel,
      CartResponseModel? getCartProductsResponseModel,
      CartResponseModel? removeProductCartResponseModel,
      Map<String, dynamic>? removeCartResponse,
      Failures? addToCartFailures,
      Failures? getCartProductsFailure,
      Failures? removeCartFailures,
      Failures? removeProductCartFailures}) {
    return CartState(
        addToCartRequestState:
            addToCartRequestState ?? this.addToCartRequestState,
        getCartProductsRequestState:
            getCartProductsRequestState ?? this.getCartProductsRequestState,
        removeProductCartRequestState:
            removeProductCartRequestState ?? this.removeProductCartRequestState,
        removeCartRequestState:
            removeCartRequestState ?? this.removeCartRequestState,
        addToCartResponseModel:
            addToCartResponseModel ?? this.addToCartResponseModel,
        getCartProductsResponseModel:
            getCartProductsResponseModel ?? this.getCartProductsResponseModel,
        removeProductCartResponseModel: removeProductCartResponseModel ??
            this.removeProductCartResponseModel,
        removeCartResponse: removeCartResponse ?? this.removeCartResponse,
        addToCartFailures: addToCartFailures ?? this.addToCartFailures,
        getCartProductsFailure:
            getCartProductsFailure ?? this.getCartProductsFailure,
        removeCartFailures: removeCartFailures ?? this.removeCartFailures,
        removeProductCartFailures:
            removeProductCartFailures ?? this.removeProductCartFailures);
  }
}

final class CartInitial extends CartState {
  CartInitial()
      : super(
            addToCartRequestState: RequestState.init,
            getCartProductsRequestState: RequestState.init,
            removeProductCartRequestState: RequestState.init,
            removeCartRequestState: RequestState.init);
}
