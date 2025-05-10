part of 'cart_bloc.dart';

class CartState {
  RequestState? addToCartRequestState;
  RequestState? getCartProductsRequestState;
  CartResponseModel? addToCartResponseModel;
  CartResponseModel? getCartProductsResponseModel;
  Failures? addToCartFailures;
  Failures? getCartProductsFailure;

  CartState(
      {this.addToCartResponseModel,
      this.getCartProductsRequestState,
      this.addToCartRequestState,
      this.getCartProductsResponseModel,
      this.addToCartFailures,
      this.getCartProductsFailure});
  CartState copyWith(
      {RequestState? addToCartRequestState,
      RequestState? getCartProductsRequestState,
      CartResponseModel? addToCartResponseModel,
      CartResponseModel? getCartProductsResponseModel,
      Failures? addToCartFailures,
      Failures? getCartProductsFailure}) {
    return CartState(
        addToCartRequestState:
            addToCartRequestState ?? this.addToCartRequestState,
        getCartProductsRequestState:
            getCartProductsRequestState ?? this.getCartProductsRequestState,
        addToCartResponseModel:
            addToCartResponseModel ?? this.addToCartResponseModel,
        getCartProductsResponseModel:
            getCartProductsResponseModel ?? this.addToCartResponseModel,
        addToCartFailures: addToCartFailures ?? this.addToCartFailures,
        getCartProductsFailure:
            getCartProductsFailure ?? this.addToCartFailures);
  }
}

final class CartInitial extends CartState {
  CartInitial()
      : super(
            addToCartRequestState: RequestState.init,
            getCartProductsRequestState: RequestState.init);
}
