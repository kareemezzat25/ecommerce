import 'package:ecommerce_app/core/api/api_manager.dart';
import 'package:ecommerce_app/core/resources/app_cache.dart';
import 'package:ecommerce_app/core/resources/endpoints.dart';
import 'package:ecommerce_app/features/main_layout/favourite/data/datasources/remote/favouritesremoteds.dart';
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
}
