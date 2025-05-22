class Brand {
  final String id;
  final String name;
  final String image;
  final String link;

  Brand({
    required this.id,
    required this.name,
    required this.image,
    required this.link,
  });

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      id: json['id']?.toString() ?? '',
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      link: json['link'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'image': image, 'link': link};
  }
}
