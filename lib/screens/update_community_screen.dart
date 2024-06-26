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
              // Profile picture
              GestureDetector(
                // onTap: ,
                child: CircleAvatar(
                  radius: 48,
                  backgroundImage: CachedNetworkImageProvider(
                    '${Utils.baseUrl}storage/${community.image}',
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
              LabelInput(
                label: 'Link Grup',
                controller: _groupController,
                type: TextInputType.url,
              ),
              SizedBox(height: 32),
              // Save button
              PrimaryButton(
                text: 'Simpan',
                onPressed: () {
                  Community updatedCommunity = Community(
                    id: community.id,
                    user_id: community.user_id,
                    name: _namaController.text,
                    description: _deskripsiController.text,
                    phone_number: _noTeleponController.text,
                    group_link: _groupController.text,
                  );
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
