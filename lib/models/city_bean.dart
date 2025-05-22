class CityBean {
  String id;
  String name;
  bool isSelected;

  CityBean({this.id = '', this.name = '', this.isSelected = false});

  factory CityBean.fromJson(Map<String, dynamic> json) {
    return CityBean(
      id: json['id']?.toString() ?? '',
      name: json['name'] ?? '',
      isSelected: json['isSelected'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'isSelected': isSelected};
  }
}
