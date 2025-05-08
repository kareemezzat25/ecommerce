import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failures/failures.dart';
import 'package:ecommerce_app/features/product_details/data/models/productdetailsmodel.dart';
import 'package:ecommerce_app/features/product_details/domain/repository/productdetailsrepo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductDetailsUseCase {
  ProductDetailsRepo productDetailsRepo;

  ProductDetailsUseCase(this.productDetailsRepo);

  Future<Either<ProductDetailsModel, Failures>> call(
      {required String productId}) async {
    return await productDetailsRepo.getProductDetails(productId);
  }
}
