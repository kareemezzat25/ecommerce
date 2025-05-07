import 'package:ecommerce_app/features/products_screen/data/models/productmodel.dart';

abstract class GetProductsRemoteDs {
  Future<ProductModel> getProducts({String? id});
}
