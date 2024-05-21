part of widgets;

class PublikasiTail extends StatelessWidget {
  final int nLikes, nComments;
  final bool isLiked;
  final VoidCallback likeOnPressed;
  const PublikasiTail({
    super.key,
    required this.nLikes,
    required this.nComments,
    required this.likeOnPressed,
    required this.isLiked,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Row(
            children: [
              IconButton(
                constraints: BoxConstraints(),
                padding: EdgeInsets.all(6),
                style: const ButtonStyle(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                onPressed: likeOnPressed,
                isSelected: isLiked,
                selectedIcon: Icon(
                  CupertinoIcons.heart_fill,
                  color: Colors.red,
                ),
                icon: Icon(CupertinoIcons.heart),
              ),
              Text(nLikes.toString())
            ],
          ),
          SizedBox(
            width: 16,
          ),
          Row(
            children: [
              IconButton(
                constraints: BoxConstraints(),
                padding: EdgeInsets.all(6),
                style: const ButtonStyle(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                icon: Icon(CupertinoIcons.bubble_left),
                onPressed: () => context.go('/galeri/comments'),
              ),
              Text(nComments.toString())
            ],
          ),
          SizedBox(
            width: 16,
          ),
          IconButton(
            constraints: BoxConstraints(),
            padding: EdgeInsets.all(6),
            style: const ButtonStyle(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            icon: Icon(CupertinoIcons.link),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
