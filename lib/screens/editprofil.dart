import 'package:flutter/material.dart';

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
        backgroundColor: Colors.brown, // Ubah warna header menjadi coklat
        title: Text(
          'Edit Profil',
          style: TextStyle(fontFamily: 'Poppins', color: Colors.white), // Ubah warna teks menjadi putih
        ),
        centerTitle: true, // Menengahkan teks "Edit Profil"
        iconTheme: IconThemeData(color: Colors.white), // Ubah warna ikon kembali menjadi putih
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
              TextFormField(
                controller: _namaController,
                decoration: InputDecoration(
                  labelText: 'Nama',
                  labelStyle: TextStyle(fontFamily: 'Poppins'),
                  border: OutlineInputBorder(), // Ubah tampilan menjadi kotak
                ),
                style: TextStyle(fontFamily: 'Poppins'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: _deskripsiController,
                decoration: InputDecoration(
                  labelText: 'Deskripsi',
                  labelStyle: TextStyle(fontFamily: 'Poppins'),
                  border: OutlineInputBorder(), // Ubah tampilan menjadi kotak
                ),
                style: TextStyle(fontFamily: 'Poppins'),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Deskripsi tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: _tanggalLahirController,
                decoration: InputDecoration(
                  labelText: 'Tanggal Lahir',
                  labelStyle: TextStyle(fontFamily: 'Poppins'),
                  border: OutlineInputBorder(), // Ubah tampilan menjadi kotak
                ),
                style: TextStyle(fontFamily: 'Poppins'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Tanggal Lahir tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: _jenisKelaminController,
                decoration: InputDecoration(
                  labelText: 'Jenis Kelamin',
                  labelStyle: TextStyle(fontFamily: 'Poppins'),
                  border: OutlineInputBorder(), // Ubah tampilan menjadi kotak
                ),
                style: TextStyle(fontFamily: 'Poppins'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Jenis Kelamin tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: _noTeleponController,
                decoration: InputDecoration(
                  labelText: 'No. Telepon',
                  labelStyle: TextStyle(fontFamily: 'Poppins'),
                  border: OutlineInputBorder(), // Ubah tampilan menjadi kotak
                ),
                style: TextStyle(fontFamily: 'Poppins'),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'No. Telepon tidak boleh kosong';
                  } else if (!RegExp(r'^\d{10,15}$').hasMatch(value)) {
                    return 'No. Telepon tidak valid';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(fontFamily: 'Poppins'),
                  border: OutlineInputBorder(), // Ubah tampilan menjadi kotak
                ),
                style: TextStyle(fontFamily: 'Poppins'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email tidak boleh kosong';
                  } else if (!RegExp(r'^.+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(value)) {
                    return 'Format email tidak valid';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20.0),

              // Save button
              Center(
                child: ElevatedButton(
                  onPressed: _submitForm,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.brown), // Ubah warna tombol menjadi coklat
                  ),
                  child: Text(
                    'Simpan',
                    style: TextStyle(fontFamily: 'Poppins', color: Colors.white), // Ubah teks tombol menjadi putih
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
