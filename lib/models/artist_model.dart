part of models;

class Artist {
  final int id;
  final String name;
  final String description;
  final String phone_number;
  // final DateTime? birthday;
  // final String gender;
  final String image;
  final int user_id;

  Artist({
    required this.id,
    this.name = '',
    this.description = '',
    this.phone_number = '',
    // this.birthday,
    // this.gender = '',
    this.image = '',
    this.user_id = 0,
  });

  factory Artist.fromJson(Map<String, dynamic> json) {
    return Artist(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      // birthday: DateTime.parse(json['birthday'] as String) ?? DateTime.now(),
      phone_number: json['phone_number'],
      // gender: json['gender'] ?? '',
      image: json['image'],
      user_id: json['user_id'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        // 'birthday': birthday,
        'phone_number': phone_number,
        // 'gender': gender,
        'image': image,
        'user_id': user_id,
      };
}
