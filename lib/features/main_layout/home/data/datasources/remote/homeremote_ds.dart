import 'package:ecommerce_app/features/main_layout/home/data/models/categories_model.dart';

abstract class HomeRemoteDs {
  Future<CategoriesModel> getCategories();
}
