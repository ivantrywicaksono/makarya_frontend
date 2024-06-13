part of models;

class Like {
  final int id;
  final int publication_id;
  final int artist_id;

  Like({
    required this.id,
    required this.publication_id,
    required this.artist_id,
  });

  factory Like.fromJson(Map<String, dynamic> json) {
    return Like(
      id: json['id'] as int,
      publication_id: json['publication_id'] as int,
      artist_id: json['artist_id'] as int,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'publication_id': publication_id,
        'artist_id': artist_id,
      };
}
