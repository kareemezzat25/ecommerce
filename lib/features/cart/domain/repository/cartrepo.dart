import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failures/failures.dart';
import 'package:ecommerce_app/features/cart/data/models/cartresponse.dart';

abstract class CartRepo {
  Future<Either<CartResponseModel, Failures>> addtoCart(
      {required String productId});
}
