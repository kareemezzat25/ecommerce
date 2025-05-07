import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failures/failures.dart';
import 'package:ecommerce_app/core/failures/remotefailures.dart';
import 'package:ecommerce_app/features/products_screen/data/datasources/remote/getproductremoteds.dart';
import 'package:ecommerce_app/features/products_screen/data/models/productmodel.dart';
import 'package:ecommerce_app/features/products_screen/domain/repository/getproductsrepo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetProductRepo)
class GetProductRepoImpl extends GetProductRepo {
  GetProductsRemoteDs getProductsRemoteDs;
  GetProductRepoImpl(this.getProductsRemoteDs);
  @override
  Future<Either<ProductModel, Failures>> getProducts({String? id}) async {
    try {
      var result = await getProductsRemoteDs.getProducts(id: id);
      return Left(result);
    } catch (e) {
      return Right(RemoteFailures("SomeThing went wrong when Get Products"));
    }
  }
}
