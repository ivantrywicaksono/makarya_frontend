part of screens;

class UpdateCommunityScreen extends StatefulWidget {
  final Community community;
  const UpdateCommunityScreen({
    super.key,
    required this.community,
  });

  @override
  _UpdateCommunityScreenState createState() => _UpdateCommunityScreenState();
}

class _UpdateCommunityScreenState extends State<UpdateCommunityScreen> {
  // Text editing controllers for each profile field
  late TextEditingController _namaController = TextEditingController();
  late TextEditingController _deskripsiController = TextEditingController();
  late TextEditingController _noTeleponController = TextEditingController();
  late TextEditingController _groupController = TextEditingController();

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
    _namaController = TextEditingController(text: widget.community.name);
    _deskripsiController =
        TextEditingController(text: widget.community.description);
    _noTeleponController =
        TextEditingController(text: widget.community.phone_number);
    _groupController = TextEditingController(text: widget.community.group_link);
  }

  @override
  void dispose() {
    _namaController.dispose();
    _deskripsiController.dispose();
    _noTeleponController.dispose();
    _groupController.dispose();
    super.dispose();
  }

  void _submitForm() {}

  XFile? _image;
  File? _img;
  ImagePicker picker = ImagePicker();
  // TextEditingController _descriptionController = TextEditingController();

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
    Community community = context.read<UserProvider>().community;
    // int user_id = context.read<UserProvider>().user.id;

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
              _img == null
                  ? FutureBuilder<String>(
                      future: getImageUrl(community.image),
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
              LabelInput(
                label: 'Link Grup',
                controller: _groupController,
                type: TextInputType.url,
              ),
              SizedBox(height: 32),
              // Save button
              PrimaryButton(
                text: 'Simpan',
                onPressed: () async {
                  String? uploadImagePath;
                  if (_image != null) {
                    String extension = _image!.name.split('.').last;
                    uploadImagePath = 'community/${community.id}.$extension';
                  }
                  Community updatedCommunity = Community(
                    id: community.id,
                    user_id: community.user_id,
                    name: _namaController.text,
                    description: _deskripsiController.text,
                    phone_number: _noTeleponController.text,
                    group_link: _groupController.text,
                    image: uploadImagePath ?? community.image,
                  );
                  if (_image != null) {
                    await FirebaseStorage.instance
                        .ref(uploadImagePath)
                        .putFile(_img!);
                  }
                  context.read<CommunityProvider>().update(updatedCommunity);
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
