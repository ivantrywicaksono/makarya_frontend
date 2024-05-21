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
        padding: EdgeInsets.all(22),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  foregroundImage: AssetImage('assets/images/avatar.png'),
                  radius: 24,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('username'),
                        Text('3 hari'),
                      ],
                    ),
                    Text('Komentar'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
