import 'package:ecommerce_app/core/api/api_manager.dart';
import 'package:ecommerce_app/core/resources/endpoints.dart';
import 'package:ecommerce_app/features/main_layout/home/data/datasources/remote/homeremote_ds.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/categories_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRemoteDs)
class HomeRemoteDsImpl extends HomeRemoteDs {
  ApiManager apiManager;
  HomeRemoteDsImpl(this.apiManager);

  @override
  Future<CategoriesModel> getCategories() async {
    var categories = await apiManager.getData(AppEndpoints.allCategories);
    CategoriesModel categoriesModel = CategoriesModel.fromJson(categories.data);
    return categoriesModel;
  }
}
