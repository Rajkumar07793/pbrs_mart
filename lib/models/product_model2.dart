class ProductModel2 {
  final String? id;
  final String? name;
  final double? price;
  final String? imageUrl;
  final String? description;

  ProductModel2({
    this.id,
    this.name,
    this.price,
    this.imageUrl,
    this.description,
  });

  factory ProductModel2.fromJson(Map<String, dynamic> json) {
    return ProductModel2(
      id: json['id'] as String?,
      name: json['name'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      imageUrl: json['imageUrl'] as String?,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'imageUrl': imageUrl,
      'description': description,
    };
  }
}
