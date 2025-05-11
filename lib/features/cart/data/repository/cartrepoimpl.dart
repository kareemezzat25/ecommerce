import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/api/api_manager.dart';
import 'package:ecommerce_app/core/failures/failures.dart';
import 'package:ecommerce_app/core/failures/remotefailures.dart';
import 'package:ecommerce_app/features/cart/data/datasources/remote/cartremoteds.dart';
import 'package:ecommerce_app/features/cart/data/models/cartresponse.dart';
import 'package:ecommerce_app/features/cart/domain/repository/cartrepo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartRepo)
class CartRepoImpl extends CartRepo {
  CartRemoteDs cartRemoteDs;
  CartRepoImpl(this.cartRemoteDs);
  @override
  Future<Either<CartResponseModel, Failures>> addtoCart(
      {required String productId}) async {
    try {
      var result = await cartRemoteDs.addToCart(productId: productId);
      return Left(result);
    } catch (e) {
      return Right(RemoteFailures(
          "SomeThing Went Wrong When Fetch Add Product in Cart"));
    }
  }

  @override
  Future<Either<CartResponseModel, Failures>> getCartProducts() async {
    try {
      var result = await cartRemoteDs.getCartProducts();
      if (result.status == "success") {
        return Left(result);
      } else {
        return Right(RemoteFailures("Failed to fetch cart products"));
      }
    } catch (e) {
      return Right(RemoteFailures(
          "SomeThing Went Wrong When Fetch Products That Exist In Cart"));
    }
  }

  @override
  Future<Either<CartResponseModel, Failures>> removeProductFromCart(
      {required String productId}) async {
    try {
      var result =
          await cartRemoteDs.removeProductFromCart(productId: productId);

      return Left(result);
    } catch (e) {
      return Right(
          RemoteFailures("SomeThing Went Wrong When Remove Product From Cart"));
    }
  }

  @override
  Future<Either<Map<String, dynamic>, Failures>> removeCartProducts() async {
    try {
      var result = await cartRemoteDs.removeCartproducts();

      if (result['statusMsg'] == "success") {
        return Left(result);
      } else {
        return Right(RemoteFailures(result['message']));
      }
    } catch (e) {
      return Right(RemoteFailures(
          "SomeThing Went Wrong When Remove Products From Cart"));
    }
  }
}
