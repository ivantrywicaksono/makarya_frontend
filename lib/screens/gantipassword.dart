import 'package:flutter/material.dart';

class GantiPasswordPage extends StatefulWidget {
  const GantiPasswordPage({Key? key}) : super(key: key);

  @override
  State<GantiPasswordPage> createState() => _GantiPasswordPageState();
}

class _GantiPasswordPageState extends State<GantiPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _konfirmasiPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown, // Setting the background color to brown
        title: Text(
          'Ganti Password',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white, // Setting text color to white
          ),
        ),
        centerTitle: true, // Centering the title
        iconTheme: IconThemeData(
            color: Colors.white), // Set the back button icon color to white
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Password Lama',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                TextFormField(
                  controller: _oldPasswordController,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password lama tidak boleh kosong';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  style: TextStyle(fontFamily: 'Poppins'),
                ),
                const SizedBox(height: 16.0),
                Text(
                  'Password Baru',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                TextFormField(
                  controller: _newPasswordController,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password baru tidak boleh kosong';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  style: TextStyle(fontFamily: 'Poppins'),
                ),
                const SizedBox(height: 16.0),
                Text(
                  'Konfirmasi Password Baru',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                TextFormField(
                  controller: _konfirmasiPasswordController,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Konfirmasi password baru tidak boleh kosong';
                    } else if (value != _newPasswordController.text) {
                      return 'Konfirmasi password baru tidak sesuai';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  style: TextStyle(fontFamily: 'Poppins'),
                ),
                const SizedBox(height: 32.0),
                Center(
                  // Memposisikan tombol di tengah
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Simpan password baru
                        // ...
                      }
                    },
                    style: ButtonStyle(
                      // Style the button directly
                      backgroundColor: WidgetStateProperty.all<Color>(
                          Colors.brown), // Set background color to brown
                      foregroundColor: WidgetStateProperty.all<Color>(
                          Colors.white), // Set text color to white
                    ),
                    child: const Text(
                      'Simpan',
                      style: TextStyle(fontFamily: 'Poppins'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
