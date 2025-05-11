import 'dart:developer';

import 'package:dio/dio.dart';
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
    log("API Response: ${result.data}");

    CartResponseModel cartResponseModel =
        CartResponseModel.fromJson(result.data);

    log("bbbb: Number of items in cart: ${cartResponseModel.data?.products?.length ?? 0}");
    return cartResponseModel;
  }

  @override
  Future<CartResponseModel> removeProductFromCart(
      {required String productId}) async {
    var token = AppCache.getToken();

    var result = await apiManager.deleteData(
        AppEndpoints.removeItemFromCart(productId), {"token": token});

    CartResponseModel cartResponseModel =
        CartResponseModel.fromJson(result.data);

    return cartResponseModel;
  }

  @override
  Future<Map<String, dynamic>> removeCartproducts() async {
    var token = AppCache.getToken();

    try {
      Response response =
          await apiManager.deleteData(AppEndpoints.cart, {"token": token});

      if (response.statusCode == 200) {
        if (response.data['message'] == 'success') {
          return {
            'statusMsg': 'success',
            'message': 'Item removed from cart successfully',
          };
        } else {
          return {
            'statusMsg': 'fail',
            'message': response.data['message'] ?? 'Unexpected error occurred',
          };
        }
      } else {
        return {
          'statusMsg': 'fail',
          'message':
              'Failed to remove item. Status code: ${response.statusCode}',
        };
      }
    } on DioError catch (e) {
      return {
        'statusMsg': 'fail',
        'message': 'Error occurred: ${e.message}',
      };
    } catch (e) {
      return {
        'statusMsg': 'fail',
        'message': 'Unexpected error occurred: $e',
      };
    }
  }
}
