part of models;

class Comment {
  final int id;
  final String comment;
  final int publication_id;
  final int artist_id;
  final DateTime created_at;

  Comment({
    required this.id,
    required this.comment,
    required this.publication_id,
    required this.artist_id,
    required this.created_at,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      comment: json['comment'],
      publication_id: json['publication_id'],
      artist_id: json['artist_id'],
      created_at: DateTime.parse(json['created_at'] as String),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'comment': comment,
        'publication_id': publication_id,
        'artist_id': artist_id,
        'created_at': created_at,
      };
}
