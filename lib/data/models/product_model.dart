class ProductModel {
  final String productId;
  final String productName;
  final String description;
  final double price;
  final String imageUrl;

  ProductModel({
    required this.productId,
    required this.productName,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productId: json['productId'],
      productName: json['productName'],
      description: json['description'],
      price: json['price'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'productName': productName,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
    };
  }
}
