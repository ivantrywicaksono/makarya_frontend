part of widgets;

class PublikasiTail extends StatelessWidget {
  final int nLikes, nComments;
  const PublikasiTail({
    super.key,
    required this.nLikes,
    required this.nComments,
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
                icon: Icon(Icons.favorite_outline),
                onPressed: () {},
              ),
              Text(nLikes.toString())
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.comment_outlined),
                onPressed: () {},
              ),
              Text(nComments.toString())
            ],
          ),
          SizedBox(
            width: 10,
          ),
          IconButton(
            icon: Icon(Icons.send_outlined),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
