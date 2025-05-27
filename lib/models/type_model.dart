class TypeModel {
  final int id;
  final String name;
  final String slug;
  final String image;

  TypeModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
  });

  factory TypeModel.fromJson(Map<String, dynamic> json) {
    return TypeModel(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      image: json['image'],
    );
  }
}
