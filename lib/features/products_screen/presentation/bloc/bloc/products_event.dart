part of 'products_bloc.dart';

abstract class ProductsEvent {}

class GetProductsEvent extends ProductsEvent {
  String? categoryId;
  GetProductsEvent(this.categoryId);
}
