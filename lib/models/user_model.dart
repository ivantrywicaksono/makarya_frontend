part of models;

class User {
  final int id;
  final String name;
  final String email;
  String password;
  final String role;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.password = '',
    required this.role,
  });

  factory User.fromJson({
    required int id,
    required String name,
    required String email,
    // required String password,
    required String role,
  }) {
    return User(
      id: id,
      name: name,
      email: email,
      // password: password,
      role: role,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'password': password,
        'role': role,
      };
}
