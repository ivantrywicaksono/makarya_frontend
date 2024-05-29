part of screens;

class UpdatePublikasiScreen extends StatefulWidget {
  final String title;

  const UpdatePublikasiScreen({super.key, required this.title});

  @override
  State<UpdatePublikasiScreen> createState() => _UpdatePublikasiScreenState();
}

class _UpdatePublikasiScreenState extends State<UpdatePublikasiScreen> {
  TextEditingController _deskripsiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Color primary = Utils.primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 18),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset('assets/images/publikasi.png'),
              ),
            ),
            LabelInput(
              controller: _deskripsiController,
              type: TextInputType.text,
              label: 'Deskripsi',
              placeholder: 'Masukkan deskripsi karya Anda',
            ),
            SizedBox(height: 48),
            Container(
              width: MediaQuery.of(context).size.width,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Simpan',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600)),
                ),
                style: ButtonStyle(
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                    padding: MaterialStatePropertyAll(
                        EdgeInsets.symmetric(vertical: 20)),
                    backgroundColor: MaterialStatePropertyAll(primary)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
