class UserModel {
  int id;
  String? name;
  String? email;
  String? password;
  String? avatar;
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    this.avatar,
  });

  factory UserModel.empty() {
    return UserModel(id: 0, name: "", email: "", password: "", avatar: null);
  }
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"] ?? "",
      name: json["name"] ?? "",
      email: json["email"] ?? "",
      password: json["password"] ?? "",
      avatar: json["avatar"] ?? "",
    );
  }
}
