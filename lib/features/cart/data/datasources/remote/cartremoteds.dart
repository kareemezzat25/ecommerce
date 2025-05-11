import 'package:ecommerce_app/features/cart/data/models/cartresponse.dart';

abstract class CartRemoteDs {
  Future<CartResponseModel> addToCart({required String productId});
  Future<CartResponseModel> getCartProducts();
  Future<CartResponseModel> removeProductFromCart({required String productId});
  Future<Map<String, dynamic>> removeCartproducts();
}
