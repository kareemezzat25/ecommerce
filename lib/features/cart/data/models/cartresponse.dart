class CartResponseModel {
  final String status;
  final int numOfCartItems;
  final String cartId;
  final CartData data;

  CartResponseModel({
    required this.status,
    required this.numOfCartItems,
    required this.cartId,
    required this.data,
  });

  factory CartResponseModel.fromJson(Map<String, dynamic> json) =>
      CartResponseModel(
        status: json['status'],
        numOfCartItems: json['numOfCartItems'],
        cartId: json['cartId'],
        data: CartData.fromJson(json['data']),
      );
}

class CartData {
  final String id;
  final String cartOwner;
  final List<CartProduct> products;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int totalCartPrice;

  CartData({
    required this.id,
    required this.cartOwner,
    required this.products,
    required this.createdAt,
    required this.updatedAt,
    required this.totalCartPrice,
  });

  factory CartData.fromJson(Map<String, dynamic> json) => CartData(
        id: json['_id'],
        cartOwner: json['cartOwner'],
        products: (json['products'] as List)
            .map((e) => CartProduct.fromJson(e))
            .toList(),
        createdAt: DateTime.parse(json['createdAt']),
        updatedAt: DateTime.parse(json['updatedAt']),
        totalCartPrice: json['totalCartPrice'],
      );
}

class CartProduct {
  final int count;
  final String id;
  final Product product;
  final int price;

  CartProduct({
    required this.count,
    required this.id,
    required this.product,
    required this.price,
  });

  factory CartProduct.fromJson(Map<String, dynamic> json) => CartProduct(
        count: json['count'],
        id: json['_id'],
        product: Product.fromJson(json['product']),
        price: json['price'],
      );
}

class Product {
  final List<Subcategory> subcategory;
  final String id;
  final String title;
  final int quantity;
  final String imageCover;
  final Category category;
  final dynamic brand;
  final double ratingsAverage;

  Product({
    required this.subcategory,
    required this.id,
    required this.title,
    required this.quantity,
    required this.imageCover,
    required this.category,
    this.brand,
    required this.ratingsAverage,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        subcategory: (json['subcategory'] as List)
            .map((e) => Subcategory.fromJson(e))
            .toList(),
        id: json['_id'],
        title: json['title'],
        quantity: json['quantity'],
        imageCover: json['imageCover'],
        category: Category.fromJson(json['category']),
        brand: json['brand'],
        ratingsAverage: json['ratingsAverage'].toDouble(),
      );
}

class Subcategory {
  final String id;
  final String name;
  final String slug;
  final String category;

  Subcategory({
    required this.id,
    required this.name,
    required this.slug,
    required this.category,
  });

  factory Subcategory.fromJson(Map<String, dynamic> json) => Subcategory(
        id: json['_id'],
        name: json['name'],
        slug: json['slug'],
        category: json['category'],
      );
}

class Category {
  final String id;
  final String name;
  final String slug;
  final String image;

  Category({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json['_id'],
        name: json['name'],
        slug: json['slug'],
        image: json['image'],
      );
}
