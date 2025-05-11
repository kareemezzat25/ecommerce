part of 'cart_bloc.dart';

abstract class CartEvent {}

class AddToCartEvent extends CartEvent {
  String productId;
  AddToCartEvent(this.productId);
}

class GetCartProductsEvent extends CartEvent {}

class RemoveProductCartEvent extends CartEvent {
  String productId;
  RemoveProductCartEvent(this.productId);
}

class RemoveCartEvent extends CartEvent {}
