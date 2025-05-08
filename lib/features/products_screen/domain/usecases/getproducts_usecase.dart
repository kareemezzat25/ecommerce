import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failures/failures.dart';
import 'package:ecommerce_app/features/products_screen/data/models/productmodel.dart';
import 'package:ecommerce_app/features/products_screen/domain/repository/getproductsrepo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProductsUseCase {
  GetProductRepo getProductRepo;
  GetProductsUseCase(this.getProductRepo);

  Future<Either<ProductModel, Failures>> call({String? id}) {
    return getProductRepo.getProducts(id: id);
  }
}
