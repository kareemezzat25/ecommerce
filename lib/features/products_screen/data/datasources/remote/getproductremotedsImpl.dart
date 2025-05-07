import 'dart:developer';

import 'package:ecommerce_app/core/api/api_manager.dart';
import 'package:ecommerce_app/core/resources/endpoints.dart';
import 'package:ecommerce_app/features/products_screen/data/datasources/remote/getproductremoteds.dart';
import 'package:ecommerce_app/features/products_screen/data/models/productmodel.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetProductsRemoteDs)
class GetProductsRemoteDsImpl extends GetProductsRemoteDs {
  ApiManager apiManager;
  GetProductsRemoteDsImpl(this.apiManager);
  @override
  Future<ProductModel> getProducts({String? id}) async {
    try {
      var result = await apiManager.getData(AppEndpoints.getProducts,
          query: id != null ? {"category[in]": id} : null);

      ProductModel productsModel = ProductModel.fromJson(result.data);
      return productsModel;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
