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

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      role: json['roles'][0]['name'] as String,
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
