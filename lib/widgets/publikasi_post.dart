part of widgets;

class PublikasiPost extends StatelessWidget {
  final String avatar;
  double size;
  final String username;

  PublikasiPost(
      {super.key,
      this.avatar = 'assets/images/avatar.png',
      this.size = 20,
      this.username = "Vina Veronika"});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(),
        PublikasiHead(avatar: avatar, size: size, username: username),
        Image(image: AssetImage('assets/images/publikasi.png')),
        PublikasiTail(nLikes: 10, nComments: 2),
        Divider(),
      ],
    );
  }
}
