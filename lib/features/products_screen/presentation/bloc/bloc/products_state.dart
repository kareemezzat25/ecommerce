part of 'products_bloc.dart';

class ProductsState {
  RequestState? getProductRequestState;
  ProductModel? productModel;
  Failures? productsFailures;

  ProductsState(
      {this.getProductRequestState, this.productModel, this.productsFailures});

  copywith(
      {RequestState? getProductRequestState,
      ProductModel? productModel,
      Failures? productsFailures}) {
    return ProductsState(
        getProductRequestState:
            getProductRequestState ?? this.getProductRequestState,
        productModel: productModel ?? this.productModel,
        productsFailures: productsFailures ?? this.productsFailures);
  }
}

final class ProductsInitial extends ProductsState {
  ProductsInitial() : super(getProductRequestState: RequestState.init);
}
