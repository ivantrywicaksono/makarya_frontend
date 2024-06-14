part of models;

class Artist {
  final int id;
  final String name;
  final String description;
  final String phone_number;
  final String image;
  final int user_id;

  Artist({
    required this.id,
    this.name = '',
    this.description = '',
    this.phone_number = '',
    this.image = '',
    this.user_id = 0,
  });

  factory Artist.fromJson(Map<String, dynamic> json) {
    return Artist(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      phone_number: json['phone_number'],
      image: json['image'],
      user_id: json['user_id'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'phone_number': phone_number,
        'image': image,
        'user_id': user_id,
      };
}
