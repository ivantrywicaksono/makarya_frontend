part of widgets;

class PublikasiHead extends StatelessWidget {
  const PublikasiHead({
    super.key,
    required this.avatar,
    required this.size,
    required this.username,
  });

  final String avatar;
  final double size;
  final String username;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                foregroundImage: AssetImage(avatar),
                radius: size,
              ),
              SizedBox(width: 10),
              Text(
                username,
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                )),
              )
            ],
          ),
          PopupMenuButton(
              itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                    PopupMenuItem(
                      child: Text("Edit"),
                      value: "edit",
                    ),
                    PopupMenuItem(
                      child: Text("Delete"),
                      value: "delete",
                    ),
                  ])
        ],
      ),
    );
  }
}
