class GetProductModel {
  final int? id;
  final String? title;
  final double? price;
  final String? description;
  final String? image;

  GetProductModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.image,
  });

  factory GetProductModel.fromJson(Map<String, dynamic> json) =>
      GetProductModel(
        id: json["id"],
        title: json["title"],
        price: json["price"]?.toDouble(),
        description: json["description"],
        image: json["image"],
      );
}
