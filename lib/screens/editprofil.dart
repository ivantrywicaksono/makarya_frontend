import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:makarya_frontend/widgets/widgets.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  // Text editing controllers for each profile field
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _deskripsiController = TextEditingController();
  final TextEditingController _tanggalLahirController = TextEditingController();
  final TextEditingController _jenisKelaminController = TextEditingController();
  final TextEditingController _noTeleponController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _namaController.dispose();
    _deskripsiController.dispose();
    _tanggalLahirController.dispose();
    _jenisKelaminController.dispose();
    _noTeleponController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Handle form submission (update profile information)
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profil diperbarui')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile picture (optional)
              // You can add an image widget here to display a profile picture

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
                label: 'Tanggal Lahir',
                controller: _tanggalLahirController,
                type: TextInputType.datetime,
              ),
              LabelInput(
                label: 'Jenis Kelamin',
                controller: _jenisKelaminController,
                type: TextInputType.text,
              ),
              LabelInput(
                label: 'Nomor Telepon',
                controller: _noTeleponController,
                type: TextInputType.phone,
              ),
              LabelInput(
                label: 'Email',
                controller: _emailController,
                type: TextInputType.emailAddress,
              ),
              SizedBox(height: 32),
              // Save button
              PrimaryButton(
                text: 'Simpan',
                onPressed: () => context.go('/'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
