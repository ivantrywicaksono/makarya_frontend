part of widgets;

class PublikasiTail extends StatelessWidget {
  final int nLikes, nComments;
  final bool isLiked;
  final VoidCallback likeOnPressed;

  final String description;
  final DateTime date;

  const PublikasiTail({
    super.key,
    required this.nLikes,
    required this.nComments,
    required this.likeOnPressed,
    required this.isLiked,
    required this.description,
    required this.date,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
                    onPressed: () => context.go('/galeri/1/comments'),
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
                onPressed: () => context.go('/login'),
              ),
            ],
          ),
          Text(
            description,
            style: Utils.textStyle(size: 16),
            // style: GoogleFonts.poppins(),
          ),
          Text(DateFormat.yMMMMd('id_ID').format(date),
              style: Utils.textStyle(color: Colors.grey.shade700)),
        ],
      ),
    );
  }
}
