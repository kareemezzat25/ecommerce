part of 'product_details_bloc.dart';

abstract class ProductDetailsEvent {}

class GetProductDetailsEvent extends ProductDetailsEvent {
  String productId;

  GetProductDetailsEvent(this.productId);
}
