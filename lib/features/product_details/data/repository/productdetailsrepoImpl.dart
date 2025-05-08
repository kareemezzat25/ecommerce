import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failures/failures.dart';
import 'package:ecommerce_app/core/failures/remotefailures.dart';
import 'package:ecommerce_app/features/product_details/data/datasources/remote/productdetailsremoteds.dart';
import 'package:ecommerce_app/features/product_details/data/models/productdetailsmodel.dart';
import 'package:ecommerce_app/features/product_details/domain/repository/productdetailsrepo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductDetailsRepo)
class ProductDetailsRepoImpl extends ProductDetailsRepo {
  ProductDetailsRemoteDs productDetailsRemoteDs;
  ProductDetailsRepoImpl(this.productDetailsRemoteDs);
  @override
  Future<Either<ProductDetailsModel, Failures>> getProductDetails(
      String productId) async {
    try {
      var result =
          await productDetailsRemoteDs.getProductDetails(productId: productId);

      return Left(result);
    } catch (e) {
      return Right(RemoteFailures(
          "SomeThing Went Wrong When Fetch Data of This Product"));
    }
  }
}
