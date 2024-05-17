import 'package:flutter/material.dart';

class UbahStatusPengajuanPage extends StatefulWidget {
  @override
  _UbahStatusPengajuanPageState createState() =>
      _UbahStatusPengajuanPageState();
}

class _UbahStatusPengajuanPageState extends State<UbahStatusPengajuanPage> {
  final _formKey = GlobalKey<FormState>();
  final _namaKaryaController = TextEditingController();
  final _deskripsiKaryaController = TextEditingController();
  final _statusPengajuanController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text(
          'Pengajuan',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
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
                  'Ubah Status Pengajuan Haki',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
                SizedBox(height: 16.0),
                Container(
                  padding: EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Status Pengajuan',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Menunggu persetujuan pengajuan HAKI',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 32.0),
                TextFormField(
                  controller: _namaKaryaController,
                  decoration: InputDecoration(
                    labelText: 'Nama Karya',
                    border: OutlineInputBorder(),
                  ),
                  style: TextStyle(fontFamily: 'Poppins'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama karya tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _deskripsiKaryaController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    labelText: 'Deskripsi Karya',
                    border: OutlineInputBorder(),
                  ),
                  style: TextStyle(fontFamily: 'Poppins'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Deskripsi karya tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Tambahkan fungsi unggah dokumen di sini
                        print('Unggah Template ditekan');
                      },
                      child: Text(
                        'Unggah Template',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.brown,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.brown),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.symmetric(vertical: 20.0)),
                        side: MaterialStateProperty.all<BorderSide>(
                            BorderSide(color: Colors.brown)),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    ElevatedButton(
                      onPressed: () {
                        // Tambahkan fungsi unduh template di sini
                        print('Unduh Dokumen ditekan');
                      },
                      child: Text(
                        'Unduh Dokumen',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.brown,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.brown),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.symmetric(vertical: 20.0)),
                        side: MaterialStateProperty.all<BorderSide>(
                            BorderSide(color: Colors.brown)),
                      ),
                    ),
                    SizedBox(height: 16.0), // Spasi tambahan di sini
                    TextFormField(
                      controller: _statusPengajuanController,
                      decoration: InputDecoration(
                        labelText: 'Status Pengajuan',
                        border: OutlineInputBorder(),
                      ),
                      style: TextStyle(fontFamily: 'Poppins'),
                    ),
                  ],
                ),
                SizedBox(height: 32.0),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        // Tambahkan fungsi simpan di sini
                        print('Form valid dan tombol simpan ditekan');
                      }
                    },
                    child: Text(
                      'Simpan',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.brown),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 24.0)),
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
