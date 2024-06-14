part of models;

class Community {
  final int id;
  final String name;
  final String description;
  final String phone_number;
  final String image;
  final int user_id;
  final String group_link;

  Community({
    this.description = '',
    this.phone_number = '',
    this.image = '',
    this.user_id = 0,
    this.group_link = '',
    required this.id,
    this.name = '',
  });

  factory Community.fromJson(Map<String, dynamic> json) {
    return Community(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      phone_number: json['phone_number'],
      group_link: json['group_link'],
      image: json['image'],
      user_id: json['user_id'],
    );
  }
}
