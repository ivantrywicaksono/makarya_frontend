part of screens;

class CommentsScreen extends StatelessWidget {
  final String title;

  const CommentsScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            CommentItem(username: 'vinaveronika', comment: 'Keren banget!'),
            CommentItem(username: 'jokowinarno', comment: 'Sangat bagus!'),
            CommentItem(username: 'wenna', comment: 'Indah sekali!'),
            CommentItem(username: 'jasmine', comment: 'Sangat menginspirasi!'),
            CommentItem(username: 'indra', comment: 'Karya yang estetik!'),
          ],
        ),
      ),
    );
  }
}

class CommentItem extends StatelessWidget {
  final String username, comment;

  const CommentItem({
    super.key, required this.username, required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          CircleAvatar(
            foregroundImage: AssetImage('assets/images/avatar.png'),
            radius: 24,
          ),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    username,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Text('3 hari'),
                ],
              ),
              SizedBox(height: 2),
              Text(comment),
            ],
          ),
        ],
      ),
    );
  }
}
