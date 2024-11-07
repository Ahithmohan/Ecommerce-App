import 'rating.dart';

class ProductResponseModel {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;

  ProductResponseModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
  });

  factory ProductResponseModel.fromJson(Map<String, dynamic> json) {
    return ProductResponseModel(
      id: json['id'],
      title: json['title'],
      price: (json['price'] as num?)?.toDouble(),
      description: json['description'] as String?,
      image: json['image'] as String?,
    );
  }
}
