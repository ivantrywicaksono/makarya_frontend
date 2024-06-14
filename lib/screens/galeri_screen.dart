part of screens;

enum GalleryViewMode { forYou, followed }

class GaleriScreen extends StatefulWidget {
  GaleriScreen({super.key});

  @override
  State<GaleriScreen> createState() => _GaleriScreenState();
}

class _GaleriScreenState extends State<GaleriScreen> {
  GalleryViewMode galleryViewMode = GalleryViewMode.forYou;

  @override
  void initState() {
    super.initState();
    context.read<PublicationProvider>().getAll();
  }

  @override
  Widget build(BuildContext context) {
    List<Publication> publications =
        context.watch<PublicationProvider>().publications;

    Color fillColor = Utils.primaryColor;
    Color textColor = Colors.white;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go('/galeri/create');
        },
        backgroundColor: Utils.primaryColor,
        child: Icon(
          CupertinoIcons.add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        title: Text("Galeri"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Row(
            //   children: [
            //     Expanded(
            //       child: InkWell(
            //         onTap: () => setState(
            //             () => galleryViewMode = GalleryViewMode.forYou),
            //         child: Container(
            //           decoration: BoxDecoration(
            //               color: galleryViewMode == GalleryViewMode.forYou
            //                   ? fillColor
            //                   : textColor,
            //               border: Border(
            //                 right: BorderSide(color: Colors.black),
            //               )),
            //           padding: EdgeInsets.symmetric(vertical: 12),
            //           child: Center(
            //             child: Text(
            //               "Untuk Anda",
            //               style: TextStyle(
            //                 color: galleryViewMode == GalleryViewMode.forYou
            //                     ? textColor
            //                     : fillColor,
            //               ),
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //     Expanded(
            //       child: InkWell(
            //         onTap: () => setState(
            //             () => galleryViewMode = GalleryViewMode.followed),
            //         child: Container(
            //           decoration: BoxDecoration(
            //             color: galleryViewMode == GalleryViewMode.followed
            //                 ? fillColor
            //                 : textColor,
            //           ),
            //           padding: EdgeInsets.symmetric(vertical: 12),
            //           child: Center(
            //             child: Text(
            //               "Mengikuti",
            //               style: TextStyle(
            //                 color: galleryViewMode == GalleryViewMode.followed
            //                     ? textColor
            //                     : fillColor,
            //               ),
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            for (Publication p in publications)
              PublikasiPost(
                publication: p,
                onDeleteTap: () =>
                    context.read<PublicationProvider>().delete(p.id),
              ),
          ],
        ),
      ),
    );
  }
}
