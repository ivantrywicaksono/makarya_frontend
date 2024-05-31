part of screens;

class UpdateEventScreen extends StatefulWidget {
  final String title;

  const UpdateEventScreen({super.key, required this.title});

  @override
  State<UpdateEventScreen> createState() => _UpdateEventScreenState();
}

class _UpdateEventScreenState extends State<UpdateEventScreen> {
  File? _image;
  ImagePicker picker = ImagePicker();
  TextEditingController _lokasiController = TextEditingController();
  TextEditingController _tanggalController = TextEditingController();
  TextEditingController _waktuController = TextEditingController();
  TextEditingController _hargaController = TextEditingController();

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
    Color primary = Utils.getPrimaryColor(context);

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
                child: _image != null
                    ? Image.file(_image!)
                    : Image.asset('assets/images/publikasi.png'),
              ),
            ),
            SizedBox(height: 12),
            TextButton.icon(
              style: ButtonStyle(
                padding: MaterialStatePropertyAll(
                    EdgeInsets.symmetric(vertical: 20, horizontal: 90)),
                side: MaterialStatePropertyAll(BorderSide(color: primary, width: 2)),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
              ),
              onPressed: () => getImageFromGallery(),
              icon: Icon(CupertinoIcons.add),
              label: Text(
                'Unggah Gambar',
                style: GoogleFonts.poppins(),
              ),
            ),
            SizedBox(height: 22),
            LabelInput(
              controller: _lokasiController,
              type: TextInputType.text,
              label: 'Lokasi',
              placeholder: 'e.g. Alun-Alun Jember',
            ),
            Row(
              children: [
                Expanded(
                  child: LabelInput(
                    controller: _tanggalController,
                    type: TextInputType.text,
                    label: 'Tanggal',
                    placeholder: '28 April 2024',
                    readOnly: true,
                    onTap: () async {
                      final DateTime? pickedDate = await showCupertinoModalPopup(
                        context: context,
                        builder: (context) => Container(color: Colors.white,
                          height: 216,
                          child: CupertinoDatePicker(
                            mode: CupertinoDatePickerMode.date,
                            initialDateTime: DateTime.now(),
                            onDateTimeChanged: (dateTime) {
                            _tanggalController.text = DateFormat('dd MMMM yyyy', 'id_ID').format(dateTime);
                          },
                        ),
                      ),
                    );
                  },
                ),),
                SizedBox(width: 16),
                Expanded(
                  child: LabelInput(
                      controller: _waktuController,
                      type: TextInputType.text,
                      label: 'Waktu',
                      placeholder: '09.00',
                      readOnly: true,
                      onTap: () async {
                        final TimeOfDay? pickedTime = await showCupertinoModalPopup(
                          context: context,
                          builder: (context) => Container(color: Colors.white,
                            height: 216,
                            child: CupertinoTimerPicker(
                              mode: CupertinoTimerPickerMode.hm,
                              initialTimerDuration: Duration(hours: 9),
                              onTimerDurationChanged: (timerDuration) {
                              _waktuController.text = timerDuration.toString().split('.').first.padLeft(5, '0');
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            LabelInput(
              controller: _hargaController,
              type: TextInputType.text,
              label: 'Harga',
              placeholder: 'e.g. 10.000',
            ),
            SizedBox(height: 50),
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
