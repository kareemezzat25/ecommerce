class AppEndpoints {
  static const String signUp = "/api/v1/auth/signup";
  static const String signIn = "/api/v1/auth/signin";
  static const String allCategories = "/api/v1/categories";
  static String allSubCategoriesOnCategory(String id) {
    return "/api/v1/categories/$id/subcategories";
  }

  static String specificCategory(String id) {
    return "/api/v1/categories/$id";
  }

  static String getProducts = "/api/v1/products";

  static String productDetails(String id) {
    return "/api/v1/products/$id";
  }
}
