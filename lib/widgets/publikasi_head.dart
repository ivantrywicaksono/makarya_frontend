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
          IconButton(
              onPressed: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (context) {
                    return CupertinoPopupSurface(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  CupertinoIcons.delete_solid,
                                  size: 48,
                                ),
                                Text(
                                  'Hapus',
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 24,
                                          decoration: TextDecoration.none)),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () => context.go('/galeri/1/edit'),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.edit,
                                    size: 48,
                                  ),
                                  Text(
                                    'Ubah',
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 24,
                                            decoration: TextDecoration.none)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              icon: Icon(CupertinoIcons.ellipsis_vertical))
        ],
      ),
    );
  }
}
