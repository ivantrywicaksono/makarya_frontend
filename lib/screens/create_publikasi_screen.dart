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
            Padding(
              padding: EdgeInsets.only(bottom: 18),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: _image != null
                    ? Image.file(_image!)
                    : Text('assets/images/create_message.png'),
              ),
            ),
            TextButton.icon(
              style: ButtonStyle(
                padding: MaterialStatePropertyAll(
                    EdgeInsets.symmetric(vertical: 20, horizontal: 48)),
                side: MaterialStatePropertyAll(BorderSide(color: primary)),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))),
              ),
              onPressed: () => getImageFromGallery(),
              icon: Icon(CupertinoIcons.add),
              label: Text(
                'Unggah Gambar',
                style: GoogleFonts.poppins(),
              ),
            ),
            LabelInput(
              controller: _deskripsiController,
              type: TextInputType.text,
              label: 'Deskripsi',
              placeholder: 'Masukkan deskripsi karya Anda',
            ),
            SizedBox(height: 48),
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
