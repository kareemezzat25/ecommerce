part of 'product_details_bloc.dart';

class ProductDetailsState {
  RequestState? productDetailsRequestState;
  ProductDetailsModel? productDetails;
  Failures? productFailures;

  ProductDetailsState(
      {this.productDetailsRequestState,
      this.productDetails,
      this.productFailures});

  ProductDetailsState copywith(
      {RequestState? productDetailsRequestState,
      ProductDetailsModel? productDetails,
      Failures? productFailures}) {
    return ProductDetailsState(
        productDetailsRequestState:
            productDetailsRequestState ?? this.productDetailsRequestState,
        productDetails: productDetails ?? this.productDetails,
        productFailures: productFailures ?? this.productFailures);
  }
}

final class ProductDetailsInitial extends ProductDetailsState {
  ProductDetailsInitial()
      : super(productDetailsRequestState: RequestState.init);
}
