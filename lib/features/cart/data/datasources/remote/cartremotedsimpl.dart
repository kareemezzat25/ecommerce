import 'package:ecommerce_app/core/api/api_manager.dart';
import 'package:ecommerce_app/core/resources/app_cache.dart';
import 'package:ecommerce_app/core/resources/endpoints.dart';
import 'package:ecommerce_app/features/cart/data/datasources/remote/cartremoteds.dart';
import 'package:ecommerce_app/features/cart/data/models/cartresponse.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartRemoteDs)
class CartRemoteDsImpl extends CartRemoteDs {
  ApiManager apiManager = ApiManager();
  @override
  Future<CartResponseModel> addToCart({required String productId}) async {
    String? token = AppCache.getToken();
    var result = await apiManager.postData(
        AppEndpoints.cart, {"productId": productId},
        headers: {"token": token});
    CartResponseModel cartResponseModel =
        CartResponseModel.fromJson(result.data);

    return cartResponseModel;
  }

  @override
  Future<CartResponseModel> getCartProducts() async {
    String? token = AppCache.getToken();
    var result =
        await apiManager.getData(AppEndpoints.cart, headers: {"token": token});

    CartResponseModel cartResponseModel =
        CartResponseModel.fromJson(result.data);

    return cartResponseModel;
  }
}
