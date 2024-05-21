import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:makarya_frontend/utils/utils.dart';

class DaftarPage extends StatefulWidget {
  const DaftarPage({Key? key}) : super(key: key);

  @override
  State<DaftarPage> createState() => _DaftarPageState();
}

class _DaftarPageState extends State<DaftarPage> {
  final _formKey = GlobalKey<FormState>();
  String _tipeAkunValue = 'Pengguna'; // Value untuk DropdownButtonFormField
  final _nomorTeleponController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _konfirmasiPasswordController = TextEditingController();

  @override
  void dispose() {
    _nomorTeleponController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _konfirmasiPasswordController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Process the data
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );
    }
    context.go('/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(48),
        child: Column(
          children: [
            Text(
              "Daftar",
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w500,
              )),
            ),
            SizedBox(height: 8),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tipe Akun',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  DropdownButtonFormField<String>(
                    value: _tipeAkunValue,
                    items: const [
                      DropdownMenuItem<String>(
                        value: 'Pengguna',
                        child: Text('Pengguna',
                            style: TextStyle(fontFamily: 'Poppins')),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Komunitas',
                        child: Text('Komunitas',
                            style: TextStyle(fontFamily: 'Poppins')),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _tipeAkunValue = value!;
                      });
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Nomor Telepon',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  TextFormField(
                    controller: _nomorTeleponController,
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nomor telepon tidak boleh kosong';
                      } else if (!RegExp(r'^\d{10,15}$').hasMatch(value)) {
                        return 'Nomor telepon tidak valid';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(fontFamily: 'Poppins'),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Username',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  TextFormField(
                    controller: _usernameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Username tidak boleh kosong';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(fontFamily: 'Poppins'),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Email',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email tidak boleh kosong';
                      } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(value)) {
                        return 'Format email tidak valid';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(fontFamily: 'Poppins'),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Kata Sandi',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Kata sandi tidak boleh kosong';
                      } else if (value.length < 8) {
                        return 'Kata sandi harus terdiri dari minimal 8 karakter';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(fontFamily: 'Poppins'),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Konfirmasi Kata Sandi',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  TextFormField(
                    controller: _konfirmasiPasswordController,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Konfirmasi kata sandi tidak boleh kosong';
                      } else if (value != _passwordController.text) {
                        return 'Konfirmasi kata sandi tidak cocok dengan kata sandi';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(fontFamily: 'Poppins'),
                  ),
                  const SizedBox(height: 16.0),
                  Center(
                    child: ElevatedButton(
                      onPressed: _submitForm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Utils.primaryColor(
                            context), // Mengubah warna button menjadi coklat
                      ),
                      child: const Text(
                        'Daftar',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color:
                              Colors.white, // Mengubah warna teks menjadi putih
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
