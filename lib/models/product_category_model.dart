class ProductCategoryModel {
  final int? id;
  final String? slug;
  final int? subCategoryId;
  final String? name;
  final dynamic nameHindi; // Since it's Object in Java, use dynamic
  final String? description;
  final String? image;
  final String? status;
  final String? freeDes;
  final String? createdAt;
  final String? updatedAt;

  ProductCategoryModel({
    this.id,
    this.slug,
    this.subCategoryId,
    this.name,
    this.nameHindi,
    this.description,
    this.image,
    this.status,
    this.freeDes,
    this.createdAt,
    this.updatedAt,
  });

  factory ProductCategoryModel.fromJson(Map<String, dynamic> json) {
    return ProductCategoryModel(
      id: json['id'],
      slug: json['slug'],
      subCategoryId: json['sub_category_id'],
      name: json['name'],
      nameHindi: json['name_hindi'],
      description: json['description'],
      image: json['image'],
      status: json['status'],
      freeDes: json['free_des'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'slug': slug,
      'sub_category_id': subCategoryId,
      'name': name,
      'name_hindi': nameHindi,
      'description': description,
      'image': image,
      'status': status,
      'free_des': freeDes,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
