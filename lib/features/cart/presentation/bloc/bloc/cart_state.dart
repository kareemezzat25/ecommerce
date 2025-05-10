part of 'cart_bloc.dart';

class CartState {
  RequestState? addToCartRequestState;
  CartResponseModel? addToCartResponseModel;
  Failures? addToCartFailures;

  CartState(
      {this.addToCartResponseModel,
      this.addToCartRequestState,
      this.addToCartFailures});
  CartState copyWith(
      {RequestState? addToCartRequestState,
      CartResponseModel? addToCartResponseModel,
      Failures? addToCartFailures}) {
    return CartState(
        addToCartRequestState:
            addToCartRequestState ?? this.addToCartRequestState,
        addToCartResponseModel:
            addToCartResponseModel ?? this.addToCartResponseModel,
        addToCartFailures: addToCartFailures ?? this.addToCartFailures);
  }
}

final class CartInitial extends CartState {
  CartInitial() : super(addToCartRequestState: RequestState.init);
}
