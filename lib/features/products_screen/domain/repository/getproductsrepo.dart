import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failures/failures.dart';
import 'package:ecommerce_app/features/products_screen/data/models/productmodel.dart';

abstract class GetProductRepo {
  Future<Either<ProductModel, Failures>> getProducts({String? id});
}
