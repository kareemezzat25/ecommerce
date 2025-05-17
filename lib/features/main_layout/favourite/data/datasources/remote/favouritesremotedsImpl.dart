import 'package:ecommerce_app/core/api/api_manager.dart';
import 'package:ecommerce_app/core/resources/app_cache.dart';
import 'package:ecommerce_app/core/resources/endpoints.dart';
import 'package:ecommerce_app/features/main_layout/favourite/data/datasources/remote/favouritesremoteds.dart';
import 'package:ecommerce_app/features/main_layout/favourite/data/models/adddeletefavourite_model.dart';
import 'package:ecommerce_app/features/main_layout/favourite/data/models/favourite_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: FavouritesRemoteDs)
class FavouritesRemoteDsImpl extends FavouritesRemoteDs {
  ApiManager apiManager;
  FavouritesRemoteDsImpl(this.apiManager);
  @override
  Future<FavouriteModel> getUserFavourites() async {
    var token = AppCache.getToken();

    var result = await apiManager
        .getData(AppEndpoints.getUserFavourites, headers: {"token": token});

    FavouriteModel favouriteModel = FavouriteModel.fromJson(result.data);
    return favouriteModel;
  }

  @override
  Future<AddDeleteFavouriteModel> addProductFavourite(
      {required String productId}) async {
    var token = AppCache.getToken();

    var result = await apiManager.postData(
        AppEndpoints.getUserFavourites, {"productId": productId},
        headers: {"token": token});
    AddDeleteFavouriteModel addFavouriteModel =
        AddDeleteFavouriteModel.fromJson(result.data);
    return addFavouriteModel;
  }

  @override
  Future<AddDeleteFavouriteModel> deleteProductFavourite(
      {required String productId}) async {
    var token = AppCache.getToken();

    var result = await apiManager.deleteData(
        AppEndpoints.deleteProductFavourite(productId), {"token": token});

    AddDeleteFavouriteModel deleteFavouriteModel =
        AddDeleteFavouriteModel.fromJson(result.data);
    return deleteFavouriteModel;
  }
}
