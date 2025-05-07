import 'package:ecommerce_app/core/api/api_manager.dart';
import 'package:ecommerce_app/core/resources/endpoints.dart';
import 'package:ecommerce_app/features/main_layout/categories/data/datasources/remote/categoriesremoteds.dart';
import 'package:ecommerce_app/features/main_layout/categories/data/models/specificCategorymodel.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/categories_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CategoriesRemoteDs)
class CategoriesRemoteDsImpl extends CategoriesRemoteDs {
  ApiManager apiManager;
  CategoriesRemoteDsImpl(this.apiManager);

  @override
  Future<CategoriesModel> getAllSubCategoriesOnCategory(String id) async {
    var result =
        await apiManager.getData(AppEndpoints.allSubCategoriesOnCategory(id));

    CategoriesModel categoriesModel = CategoriesModel.fromJson(result.data);
    return categoriesModel;
  }

  @override
  Future<SpecificCategoryModel> getSpecificCategory(String id) async {
    var result = await apiManager.getData(AppEndpoints.specificCategory(id));

    SpecificCategoryModel specificCategoryModel =
        SpecificCategoryModel.fromJson(result.data);
    return specificCategoryModel;
  }
}
