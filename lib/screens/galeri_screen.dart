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
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/galeri/create'),
        backgroundColor: Utils.primaryColor(context),
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
          children: [
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () => setState(
                        () => galleryViewMode = GalleryViewMode.forYou),
                    child: Container(
                      decoration: BoxDecoration(
                          // color: Colors.brown,
                          border: Border(
                        right: BorderSide(color: Colors.black),
                      )),
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Center(
                        child: Text("Untuk Anda"),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () => setState(
                        () => galleryViewMode = GalleryViewMode.followed),
                    child: Container(
                      decoration: BoxDecoration(
                        // color: Colors.amber,
                      ),
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Center(
                        child: Text("Mengikuti"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            PublikasiPost(),
            PublikasiPost(),
            PublikasiPost(),
          ],
        ),
      ),
    );
  }
}
