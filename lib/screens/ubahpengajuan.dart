import 'package:flutter/material.dart';

class UbahPengajuanHakiPage extends StatefulWidget {
  @override
  _UbahPengajuanHakiPageState createState() => _UbahPengajuanHakiPageState();
}

class _UbahPengajuanHakiPageState extends State<UbahPengajuanHakiPage> {
  final _formKey = GlobalKey<FormState>();
  final _namaKaryaController = TextEditingController();
  final _deskripsiKaryaController = TextEditingController();

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
        iconTheme: IconThemeData(
          color: Colors.white, // Ubah warna ikon kembali menjadi putih
        ),
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
                  'Ubah Pengajuan Haki',
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
                        // Tombol 'Unggah Dokumen' ditekan
                      },
                      child: Text(
                        'Unggah Dokumen',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.brown,
                          fontSize: 14.0,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.brown),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 16.0)),
                        side: MaterialStateProperty.all<BorderSide>(
                            BorderSide(color: Colors.brown)),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    ElevatedButton(
                      onPressed: () {
                        // Tombol 'Unduh Template' ditekan
                      },
                      child: Text(
                        'Unduh Template',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.brown,
                          fontSize: 14.0,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.brown),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 16.0)),
                        side: MaterialStateProperty.all<BorderSide>(
                            BorderSide(color: Colors.brown)),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 150.0,
                      child: ElevatedButton(
                        onPressed: () {
                          // Tombol 'Simpan' ditekan
                        },
                        child: Text(
                          'Simpan',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 14.0,
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.brown),
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.symmetric(vertical: 12.0)),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 150.0,
                      child: ElevatedButton(
                        onPressed: () {
                          // Tombol 'Hapus' ditekan
                        },
                        child: Text(
                          'Hapus',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 14.0,
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.brown),
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.symmetric(vertical: 12.0)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
