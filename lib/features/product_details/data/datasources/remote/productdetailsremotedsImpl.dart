import 'dart:developer';

import 'package:ecommerce_app/core/api/api_manager.dart';
import 'package:ecommerce_app/core/resources/endpoints.dart';
import 'package:ecommerce_app/features/product_details/data/datasources/remote/productdetailsremoteds.dart';
import 'package:ecommerce_app/features/product_details/data/models/productdetailsmodel.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductDetailsRemoteDs)
class ProductDetailsRemoteDsImpl extends ProductDetailsRemoteDs {
  ApiManager apiManager;
  ProductDetailsRemoteDsImpl(this.apiManager);
  Future<ProductDetailsModel> getProductDetails(
      {required String productId}) async {
    try {
      var result =
          await apiManager.getData(AppEndpoints.productDetails(productId));
      ProductDetailsModel productDetailsModel =
          ProductDetailsModel.fromJson(result.data);
      return productDetailsModel;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
