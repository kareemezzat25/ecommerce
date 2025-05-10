import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failures/failures.dart';
import 'package:ecommerce_app/features/cart/data/models/cartresponse.dart';
import 'package:ecommerce_app/features/cart/domain/repository/cartrepo.dart';
import 'package:injectable/injectable.dart';

@injectable
class RemoveProductFromCartUseCase {
  CartRepo cartRepo;
  RemoveProductFromCartUseCase(this.cartRepo);
  Future<Either<CartResponseModel, Failures>> call(
      {required String productId}) {
    return cartRepo.removeProductFromCart(productId: productId);
  }
}
