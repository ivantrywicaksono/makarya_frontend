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

  File? _image;
  ImagePicker picker = ImagePicker();
  // TextEditingController _descriptionController = TextEditingController();

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
              GestureDetector(
                // onTap: ,
                child: CircleAvatar(
                  radius: 48,
                  backgroundImage: CachedNetworkImageProvider(
                    '${Utils.baseUrl}storage/${artist.image}',
                  ),
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
                onPressed: () {
                  Artist updatedArtist = Artist(
                    id: user_id,
                    name: _namaController.text,
                    description: _deskripsiController.text,
                    phone_number: _noTeleponController.text,
                  );
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
