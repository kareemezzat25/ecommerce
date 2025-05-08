import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failures/failures.dart';
import 'package:ecommerce_app/features/product_details/data/models/productdetailsmodel.dart';

abstract class ProductDetailsRepo {
  Future<Either<ProductDetailsModel, Failures>> getProductDetails(
      String productId);
}
