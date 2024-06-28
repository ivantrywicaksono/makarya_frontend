part of screens;

class EditProfilePage extends StatefulWidget {
  final Artist artist;
  const EditProfilePage({
    super.key,
    required this.artist,
  });

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  // Text editing controllers for each profile field
  late TextEditingController _namaController = TextEditingController();
  late TextEditingController _deskripsiController = TextEditingController();
  late TextEditingController _noTeleponController = TextEditingController();
  // late TextEditingController _emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Future<String> getImageUrl(String path) async {
    try {
      return await FirebaseStorage.instance.ref().child(path).getDownloadURL();
    } catch (e) {
      print('Error getting download URL for $path: $e');
      return await FirebaseStorage.instance
          .ref()
          .child('profile/profile.jpg')
          .getDownloadURL();
    }
  }

  @override
  void initState() {
    super.initState();
    _namaController = TextEditingController(text: widget.artist.name);
    _deskripsiController =
        TextEditingController(text: widget.artist.description);
    _noTeleponController =
        TextEditingController(text: widget.artist.phone_number);
    // _emailController = TextEditingController(text: widget.artist.);
  }

  @override
  void dispose() {
    _namaController.dispose();
    _deskripsiController.dispose();
    _noTeleponController.dispose();
    // _emailController.dispose();
    super.dispose();
  }

  void _submitForm() {}

  XFile? _image;
  File? _img;
  ImagePicker picker = ImagePicker();

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
    Artist artist = context.read<UserProvider>().artist;
    int user_id = context.read<UserProvider>().user.id;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profil',
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile picture
              _img == null
                  ? FutureBuilder<String>(
                      future: getImageUrl(artist.image),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else if (!snapshot.hasData) {
                          return Text('No data');
                        } else {
                          return GestureDetector(
                            onTap: () => getImageFromGallery(),
                            child: CircleAvatar(
                              backgroundImage:
                                  CachedNetworkImageProvider(snapshot.data!),
                              radius: 48,
                            ),
                          );
                        }
                      },
                    )
                  : GestureDetector(
                      onTap: () => getImageFromGallery(),
                      child: CircleAvatar(
                        radius: 48,
                        backgroundImage: FileImage(_img!),
                      ),
                    ),

              // Text fields for each profile information
              LabelInput(
                label: 'Nama',
                controller: _namaController,
                type: TextInputType.name,
              ),
              LabelInput(
                label: 'Deskripsi',
                controller: _deskripsiController,
                type: TextInputType.text,
              ),
              LabelInput(
                label: 'Nomor Telepon',
                controller: _noTeleponController,
                type: TextInputType.phone,
              ),
              // LabelInput(
              //   label: 'Email',
              //   controller: _emailController,
              //   type: TextInputType.emailAddress,
              // ),
              SizedBox(height: 32),
              // Save button
              PrimaryButton(
                text: 'Simpan',
                onPressed: () async {
                  // String path;
                  // if (_image == null) {
                  //   path = '';
                  //   return;
                  // } else {
                  //   path = _image?.path ?? '';
                  // }
                  String? uploadImagePath;
                  if (_image != null) {
                    String extension = _image!.name.split('.').last;
                    uploadImagePath = 'profile/${artist.id}.$extension';
                  }
                  Artist updatedArtist = Artist(
                    id: user_id,
                    name: _namaController.text,
                    description: _deskripsiController.text,
                    phone_number: _noTeleponController.text,
                    image: uploadImagePath ?? artist.image,
                  );
                  if (_image != null) {
                    await FirebaseStorage.instance
                        .ref(uploadImagePath)
                        .putFile(_img!);
                  }
                  context.read<ArtistProvider>().update(updatedArtist);
                  context.read<UserProvider>().getProfile();
                  context.pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
