part of models;

class Community {
  final int id;
  final String name;

  Community({
    required this.id,
    required this.name,
  });

  factory Community.fromJson({
    required int id,
    required String name,
  }) {
    return Community(
      id: id,
      name: name,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
