import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failures/failures.dart';
import 'package:ecommerce_app/features/cart/data/models/cartresponse.dart';
import 'package:ecommerce_app/features/cart/domain/repository/cartrepo.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddToCartUseCase {
  CartRepo cartRepo;

  AddToCartUseCase(this.cartRepo);
  Future<Either<CartResponseModel, Failures>> call(
      {required String productId}) {
    return cartRepo.addtoCart(productId: productId);
  }
}
