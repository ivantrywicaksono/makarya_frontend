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
        title: Text('Tambah Pengajuan'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LabelInput(
                    label: 'Nama Karya',
                    controller: _namaController,
                    type: TextInputType.name),
                LabelInput(
                  label: 'Deskripsi Karya',
                  controller: _deskripsiController,
                  type: TextInputType.text,
                ),
                SizedBox(height: 18),
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
                        backgroundColor: WidgetStateProperty.all<Color>(
                            Colors.white), // ubah warna tombol menjadi putih
                        foregroundColor: WidgetStateProperty.all<Color>(
                            Colors.brown), // ubah warna teks menjadi coklat
                        padding: WidgetStateProperty.all<EdgeInsets>(
                            EdgeInsets.symmetric(vertical: 20.0)),
                        side: WidgetStateProperty.all<BorderSide>(BorderSide(
                            color: Utils.getPrimaryColor(
                                context))), // tambahkan garis tepi coklat
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
                        backgroundColor: WidgetStateProperty.all<Color>(
                            Colors.white), // ubah warna tombol menjadi putih
                        foregroundColor: WidgetStateProperty.all<Color>(
                            Colors.brown), // ubah warna teks menjadi coklat
                        padding: WidgetStateProperty.all<EdgeInsets>(
                            EdgeInsets.symmetric(vertical: 20.0)),
                        side: WidgetStateProperty.all<BorderSide>(BorderSide(
                            color:
                                Colors.brown)), // tambahkan garis tepi coklat
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32.0),
                PrimaryButton(
                  text: 'Ajukan',
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
