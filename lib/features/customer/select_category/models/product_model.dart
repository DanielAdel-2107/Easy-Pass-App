class ProductModel {
  final String image , title;

  ProductModel({required this.image, required this.title});
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      image: json['image'] as String,
      title: json['title'] as String,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'title': title,
    };
  }
}