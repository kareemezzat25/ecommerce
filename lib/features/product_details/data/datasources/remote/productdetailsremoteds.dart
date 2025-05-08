import 'package:ecommerce_app/features/product_details/data/models/productdetailsmodel.dart';

abstract class ProductDetailsRemoteDs {
  Future<ProductDetailsModel> getProductDetails({required String productId});
}
