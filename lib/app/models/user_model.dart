class UserModel {
  final int id;
  final String email;
  final String username;
  final String password;
  final String firstName;
  final String lastName;
  final String phone;

  UserModel({
    required this.id,
    required this.email,
    required this.username,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.phone,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final address = json['address'];
    final name = json['name'];

    return UserModel(
      id: json['id'] ?? 0,
      email: json['email'] ?? '',
      username: json['username'] ?? '',
      password: json['password'] ?? '',
      firstName: name?['firstname'] ?? '',
      lastName: name?['lastname'] ?? '',
      phone: json['phone'] ?? '',
    );
  }
}
