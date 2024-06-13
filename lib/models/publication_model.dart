part of models;

class Publication {
  final int id;
  final String description;
  final String image;
  final DateTime created_at;
  final int artist_id;
  final Artist artist;
  final int likes;
  List<Comment>? comments;

  Publication({
    required this.id,
    required this.description,
    required this.image,
    required this.created_at,
    required this.artist_id,
    required this.artist,
    this.likes = 0,
    this.comments,
  });

  factory Publication.fromJson(Map<String, dynamic> json) {
    print(json);
    return Publication(
      id: json['id'] as int,
      description: json['description'] as String,
      image: json['image'] as String,
      created_at: DateTime.parse(json['created_at'] as String),
      artist_id: json['artist_id'] as int,
      artist: Artist.fromJson(json['artist']),
      likes: json['likes_count'] as int ?? 0,
      comments: (json['comments'] as List<dynamic>?)
          ?.map((item) => Comment.fromJson(item))
          .toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'description': description,
        'image': image,
        'artist_id': artist_id,
      };

  Map<String, String> toMap() {
    return {
      'id': id.toString(),
      'description': description,
      'image': image,
      'artist_id': artist_id.toString(),
    };
  }
}
