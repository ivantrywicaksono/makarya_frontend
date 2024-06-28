part of screens;

class CreatePublikasiScreen extends StatefulWidget {
  final String title;

  const CreatePublikasiScreen({super.key, required this.title});

  @override
  State<CreatePublikasiScreen> createState() => _CreatePublikasiScreenState();
}

class _CreatePublikasiScreenState extends State<CreatePublikasiScreen> {
  XFile? _image;
  File? _img;
  ImagePicker picker = ImagePicker();
  TextEditingController _descriptionController = TextEditingController();

  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = XFile(pickedFile.path);
        _img = File(pickedFile.path);
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
              padding:
                  EdgeInsets.only(top: 23, bottom: 23, left: 15, right: 15),
              decoration: BoxDecoration(
                border: Border.all(color: Color.fromRGBO(58, 24, 5, 1)),
                borderRadius: BorderRadius.circular(4),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: _image != null
                    ? Image.file(_img!)
                    : Padding(
                        padding: const EdgeInsets.all(32),
                        child: Column(
                          children: [
                            Text(
                              'Ukuran File tidak melebihi 2 MB',
                              style: TextStyle(
                                  fontSize: 12.0, fontFamily: 'poppins'),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'Gambar berformat .jpeg, .jpg atau .png',
                              style: TextStyle(
                                  fontSize: 12.0, fontFamily: 'poppins'),
                            ),
                          ],
                        ),
                      ),
              ),
            ),
            SizedBox(height: 12),
            TextButton.icon(
              style: ButtonStyle(
                padding: WidgetStatePropertyAll(
                    EdgeInsets.symmetric(vertical: 20, horizontal: 90)),
                side: WidgetStatePropertyAll(
                    BorderSide(color: primary, width: 2)),
                shape: WidgetStatePropertyAll(RoundedRectangleBorder(
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
              controller: _descriptionController,
              type: TextInputType.text,
              label: 'Deskripsi',
              placeholder: 'Masukkan deskripsi karya Anda',
            ),
            SizedBox(height: 50),
            PrimaryButton(
                text: 'Simpan',
                onPressed: () async {
                  String path;
                  if (_image == null) {
                    path = '';
                    return;
                  } else {
                    path = _image?.path ?? '';
                  }
                  var time = DateTime.now().millisecondsSinceEpoch.toString();
                  String uploadImagePath = 'publication/$time${_image!.name}';
                  Publication newPublication = Publication(
                    id: 0,
                    description: _descriptionController.text,
                    image: uploadImagePath,
                    created_at: DateTime.now(),
                    artist_id: context.read<UserProvider>().artist.id,
                    artist: context.read<UserProvider>().artist,
                  );

                  print(_image!.name);
                  print('images/$time${_image!.name}');
                  await FirebaseStorage.instance
                      .ref(uploadImagePath)
                      .putFile(_img!);

                  context
                      .read<PublicationProvider>()
                      .create(newPublication, path);

                  context.pop();
                }),
            // Container(
            //   width: MediaQuery.of(context).size.width,
            //   child: TextButton(
            //     onPressed: () {},
            //     child: Text(
            //       'Simpan',
            //       style: GoogleFonts.poppins(
            //           textStyle: TextStyle(
            //               color: Colors.white,
            //               fontSize: 20,
            //               fontWeight: FontWeight.w600)),
            //     ),
            //     style: ButtonStyle(
            //         shape: WidgetStatePropertyAll(RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(20))),
            //         padding: WidgetStatePropertyAll(
            //             EdgeInsets.symmetric(vertical: 20)),
            //         backgroundColor: WidgetStatePropertyAll(primary)),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
