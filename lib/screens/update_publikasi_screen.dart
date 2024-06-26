part of screens;

class UpdatePublikasiScreen extends StatefulWidget {
  final String title;
  final Publication publication;

  UpdatePublikasiScreen({
    super.key,
    required this.title,
    required this.publication,
  });

  @override
  State<UpdatePublikasiScreen> createState() => _UpdatePublikasiScreenState();
}

class _UpdatePublikasiScreenState extends State<UpdatePublikasiScreen> {
  late TextEditingController _deskripsiController;

  @override
  void initState() {
    super.initState();
    _deskripsiController =
        TextEditingController(text: widget.publication.description);
  }

  Future<String> getImageUrl(String path) async {
    try {
      return await FirebaseStorage.instance.ref().child(path).getDownloadURL();
    } catch (e) {
      print('Error getting download URL for $path: $e');
      return await FirebaseStorage.instance
          .ref()
          .child('publication/noimage.png')
          .getDownloadURL();
    }
  }

  @override
  Widget build(BuildContext context) {
    Color primary = Utils.primaryColor;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            FutureBuilder<String>(
              future: getImageUrl(widget.publication.image),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData) {
                  return Text('No data');
                } else {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 18),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: CachedNetworkImage(
                        imageUrl: snapshot.data!,
                      ),
                    ),
                  );
                }
              },
            ),
            SizedBox(height: 22),
            LabelInput(
              controller: _deskripsiController,
              type: TextInputType.text,
              label: 'Deskripsi',
              placeholder: 'Masukkan deskripsi karya Anda',
            ),
            SizedBox(height: 50),
            Container(
              width: MediaQuery.of(context).size.width,
              child: TextButton(
                onPressed: () {
                  // var Publication(
                  //   :id,
                  //   :image,
                  //   :created_at,
                  //   :artist_id,
                  //   :artist,
                  // ) = widget.publication;
                  // Publication updatedPublication = Publication(
                  //     id: id,
                  //     description: _deskripsiController.text,
                  //     image: image,
                  //     created_at: created_at,
                  //     artist_id: artist_id,
                  //     artist: artist);

                  context
                      .read<PublicationProvider>()
                      .update(widget.publication.id, _deskripsiController.text);
                  context.pop();
                },
                child: Text(
                  'Simpan',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600)),
                ),
                style: ButtonStyle(
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                    padding: WidgetStatePropertyAll(
                        EdgeInsets.symmetric(vertical: 20)),
                    backgroundColor: WidgetStatePropertyAll(primary)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
