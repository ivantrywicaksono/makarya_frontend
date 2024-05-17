part of screens;

class PengajuanPage extends StatefulWidget {
  @override
  _PengajuanPageState createState() => _PengajuanPageState();
}

class _PengajuanPageState extends State<PengajuanPage> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _deskripsiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown, // ubah warna header menjadi coklat
        title: Text(
          'Pengajuan',
          style:
              TextStyle(color: Colors.white), // ubah warna teks menjadi putih
        ),
        centerTitle: true, // letakkan teks header di tengah
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
                  'Nama Karya',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
                TextFormField(
                  controller: _namaController,
                  decoration: InputDecoration(
                    labelText: 'Nama Karya',
                    border: OutlineInputBorder(),
                  ),
                  style:
                      TextStyle(fontFamily: 'Poppins'), // tambahkan font disini
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama karya tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                Text(
                  'Deskripsi Karya',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
                TextFormField(
                  controller: _deskripsiController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    labelText: 'Deskripsi Karya',
                    border: OutlineInputBorder(),
                  ),
                  style:
                      TextStyle(fontFamily: 'Poppins'), // tambahkan font disini
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
                      onPressed: () {},
                      child: Text(
                        'Unggah Dokumen',
                        style: TextStyle(
                          fontFamily: 'Poppins', // tambahkan font disini
                          color: Colors.brown, // ubah warna teks menjadi coklat
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.white), // ubah warna tombol menjadi putih
                        foregroundColor: MaterialStateProperty.all<Color>(
                            Colors.brown), // ubah warna teks menjadi coklat
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.symmetric(vertical: 20.0)),
                        side: MaterialStateProperty.all<BorderSide>(BorderSide(
                            color:
                                Colors.brown)), // tambahkan garis tepi coklat
                      ),
                    ),
                    SizedBox(height: 8.0),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Unduh Template',
                        style: TextStyle(
                          fontFamily: 'Poppins', // tambahkan font disini
                          color: Colors.brown, // ubah warna teks menjadi coklat
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.white), // ubah warna tombol menjadi putih
                        foregroundColor: MaterialStateProperty.all<Color>(
                            Colors.brown), // ubah warna teks menjadi coklat
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.symmetric(vertical: 20.0)),
                        side: MaterialStateProperty.all<BorderSide>(BorderSide(
                            color:
                                Colors.brown)), // tambahkan garis tepi coklat
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Formulir valid, ajukan pengajuan
                        // ...
                      }
                    },
                    child: Text(
                      'Ajukan',
                      style: TextStyle(
                        fontFamily: 'Poppins', // tambahkan font disini
                        color: Colors.white, // ubah warna teks menjadi putih
                      ),
                    ),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.symmetric(
                              vertical: 12.0,
                              horizontal:
                                  32.0)), // sesuaikan padding untuk mengecilkan tombol
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.brown), // ubah warna tombol menjadi coklat
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
