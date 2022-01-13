import 'dart:ffi';

final String tableProducts = 'products';

class ProductFields {
  static final List<String> values = [
    /// Add all fields
    id, image, title, description, price, category, time
  ];

  static final String id = '_id';
  static final String image = 'image';
  static final String title = 'title';
  static final String description = 'description';
  static final String price = 'price';
  static final String category = 'category';
  static final String time = 'time';
}

class Product {
  final int? id;
  final String image;
  final String title;
  final String description;
  final String price;
  final String category;
  final DateTime createdTime;

  const Product({
    this.id,
    required this.image,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    required this.createdTime,
  });

  Product copy({
    int? id,
    String? image,
    String? title,
    String? description,
    String? price,
    String? category,
    DateTime? createdTime,
  }) =>
      Product(
        id: id ?? this.id,
        image: image ?? this.image,
        title: title ?? this.title,
        description: description ?? this.description,
        price: price ?? this.price,
        category: category ?? this.category,
        createdTime: createdTime ?? this.createdTime,
      );

  static Product fromJson(Map<String, Object?> json) => Product(
    id: json[ProductFields.id] as int?,
    image: json[ProductFields.image] as String,
    title: json[ProductFields.title] as String,
    description: json[ProductFields.description] as String,
    price: json[ProductFields.price] as String,
    category: json[ProductFields.category] as String,
    createdTime: DateTime.parse(json[ProductFields.time] as String),
  );

  Map<String, Object?> toJson() => {
    ProductFields.id: id,
    ProductFields.image: image,
    ProductFields.title: title,
    ProductFields.description: description,
    ProductFields.price: price,
    ProductFields.category: category,
    ProductFields.time: createdTime.toIso8601String(),
  };
}