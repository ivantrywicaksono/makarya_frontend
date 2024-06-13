part of widgets;

class PublikasiPost extends StatefulWidget {
  final Publication publication;

  PublikasiPost({
    super.key,
    required this.publication,
  });

  @override
  State<PublikasiPost> createState() => _PublikasiPostState();
}

class _PublikasiPostState extends State<PublikasiPost> {
  bool _isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(),
        PublikasiHead(
            publication: widget.publication,
            ),
        CachedNetworkImage(
          imageUrl: '${Utils.baseUrl}storage/${widget.publication.image}',
        ),
        PublikasiTail(
          nLikes: widget.publication.likes,
          nComments: widget.publication.comments?.length ?? 0,
          likeOnPressed: _toggleLike,
          isLiked: _isLiked,
          date: widget.publication.created_at,
          description: widget.publication.description,
        ),
        Divider(),
      ],
    );
  }

  void _toggleLike() {
    setState(() {
      _isLiked = !_isLiked;
    });
  }
}
