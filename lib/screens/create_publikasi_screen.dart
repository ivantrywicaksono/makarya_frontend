part of screens;

class CreatePublikasiScreen extends StatefulWidget {
  final String title;

  const CreatePublikasiScreen({super.key, required this.title});

  @override
  State<CreatePublikasiScreen> createState() => _CreatePublikasiScreenState();
}

class _CreatePublikasiScreenState extends State<CreatePublikasiScreen> {
  File? _image;
  ImagePicker picker = ImagePicker();
  TextEditingController _deskripsiController = TextEditingController();

  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
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
            Container(
              padding: EdgeInsets.only(top: 23, bottom: 23, left: 15, right: 15),
              decoration: BoxDecoration(
                border: Border.all(color: Color.fromRGBO(58, 24, 5, 1)),
                borderRadius: BorderRadius.circular(4),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: _image != null
                    ? Image.file(_image!)
                    : Padding(
                      padding: const EdgeInsets.all(32),
                      child: Column(
                        children: [
                          Text(
                            'Ukuran File tidak melebihi 2 MB',
                            style: TextStyle(fontSize: 12.0, fontFamily: 'poppins'),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Gambar berformat .jpeg, .jpg atau .png',
                            style: TextStyle(fontSize: 12.0, fontFamily: 'poppins'),
                          ),
                        ],
                      ),
                    ),
              ),
            ),
            SizedBox(height: 12),
            TextButton.icon(
              style: ButtonStyle(
                padding: MaterialStatePropertyAll(
                    EdgeInsets.symmetric(vertical: 20, horizontal: 90)),
                side: MaterialStatePropertyAll(BorderSide(color: primary, width: 2)),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
              ),
              onPressed: () => getImageFromGallery(),
              icon: Icon(CupertinoIcons.add),
              label: Text(
                'Unggah Gambar',
                style: GoogleFonts.poppins(),
              ),
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
                onPressed: () {},
                child: Text(
                  'Simpan',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600)),
                ),
                style: ButtonStyle(
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                    padding: MaterialStatePropertyAll(
                        EdgeInsets.symmetric(vertical: 20)),
                    backgroundColor: MaterialStatePropertyAll(primary)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
