class UserModel {
  final String id;
  final String name;
  final String email;
  final String role;

  UserModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.role});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      role: json["role"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "role": role,
    };
  }
  @override
  String toString() {
    // TODO: implement toString
    return 'UserModel(id: $id, name: $name, email: $email, role: $role)';
  }
}
