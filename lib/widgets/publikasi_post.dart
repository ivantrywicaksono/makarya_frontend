part of widgets;

class PublikasiPost extends StatefulWidget {
  final String avatar;
  double size;
  final String username;

  PublikasiPost(
      {super.key,
      this.avatar = 'assets/images/avatar.png',
      this.size = 20,
      this.username = "Vina Veronika"});

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
            avatar: widget.avatar,
            size: widget.size,
            username: widget.username),
        Image(image: AssetImage('assets/images/publikasi.png')),
        PublikasiTail(
          nLikes: 10,
          nComments: 2,
          likeOnPressed: _toggleLike,
          isLiked: _isLiked,
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
