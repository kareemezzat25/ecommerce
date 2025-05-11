import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failures/failures.dart';
import 'package:ecommerce_app/features/cart/domain/repository/cartrepo.dart';
import 'package:injectable/injectable.dart';

@injectable
class RemoveCartProductsUseCase {
  CartRepo cartRepo;
  RemoveCartProductsUseCase(this.cartRepo);

  Future<Either<Map<String, dynamic>, Failures>> call() {
    return cartRepo.removeCartProducts();
  }
}
