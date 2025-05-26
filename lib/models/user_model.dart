class UserModel {
  final String name;
  final String mobile;
  final String password;

  UserModel({
    required this.name,
    required this.mobile,
    required this.password,
    required String email,
  });

  Map<String, dynamic> toJson() {
    return {'name': name, 'mobile': mobile, 'password': password};
  }
}
