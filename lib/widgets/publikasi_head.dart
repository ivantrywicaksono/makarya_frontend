part of widgets;

class PublikasiHead extends StatelessWidget {
  final Publication publication;
  void Function() onDeleteTap;

  PublikasiHead({super.key, required this.publication, required this.onDeleteTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => context.go('/galeri/userdetail', extra: publication.artist),
            child: Row(
              children: [
                CircleAvatar(
                  foregroundImage: CachedNetworkImageProvider(
                    '${Utils.baseUrl}storage/${publication.artist.image}',
                  ),
                  radius: 20,
                ),
                SizedBox(width: 10),
                Text(
                  publication.artist.name,
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  )),
                )
              ],
            ),
          ),
          if (publication.artist_id == context.read<UserProvider>().artist.id) 
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
                            GestureDetector(
                              onTap: () {
                                onDeleteTap();
                                context.pop();
                              },
                              child: Column(
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
                            ),
                            GestureDetector(
                              onTap: () => context.go(
                                  '/galeri/${publication.id}/edit',
                                  extra: publication),
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
