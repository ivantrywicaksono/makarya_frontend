part of screens;

class CreateEventScreen extends StatefulWidget {
  final String title;

  const CreateEventScreen({super.key, required this.title});

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  File? _image;
  ImagePicker picker = ImagePicker();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  TextEditingController _priceController = TextEditingController();

  late DateTime _date;
  late TimeOfDay _time;

  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  void _simpanOnTap() {
    String path;
    if (_image == null) {
      path = '';
    } else {
      path = _image?.path ?? '';
    }
    Event newEvent = Event(
      id: 0,
      community_id: context.read<UserProvider>().community.id,
      name: _nameController.text,
      location: _locationController.text,
      image: '',
      date: _date,
      time: _time,
      price: int.parse(_priceController.text),
    );
    context.read<EventProvider>().create(newEvent, path);
    context.pop();
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
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Color.fromRGBO(58, 24, 5, 1)),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: _image != null
                    ? Image.file(_image!)
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 48,
                          vertical: 64,
                        ),
                        child:
                            // Column(
                            // children: [
                            // Text(
                            //   'Ukuran File tidak melebihi 2 MB',
                            //   style: TextStyle(
                            //       fontSize: 12.0, fontFamily: 'poppins'),
                            // ),
                            // SizedBox(height: 8.0),
                            Text(
                          'Gambar berformat .jpeg, .jpg atau .png',
                          style:
                              TextStyle(fontSize: 12.0, fontFamily: 'poppins'),
                        ),
                        // ],
                        // ),
                      ),
              ),
            ),
            SizedBox(height: 12),
            TextButton.icon(
              style: ButtonStyle(
                padding: WidgetStatePropertyAll(
                    EdgeInsets.symmetric(vertical: 20, horizontal: 90)),
                side: WidgetStatePropertyAll(
                    BorderSide(color: primary, width: 2)),
                shape: WidgetStatePropertyAll(RoundedRectangleBorder(
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
              controller: _nameController,
              type: TextInputType.text,
              label: 'Nama',
              placeholder: 'e.g. Pameran Batik',
            ),
            LabelInput(
              controller: _locationController,
              type: TextInputType.text,
              label: 'Lokasi',
              placeholder: 'e.g. Alun-Alun Jember',
            ),
            Row(
              children: [
                Expanded(
                  child: LabelInput(
                    controller: _dateController,
                    type: TextInputType.text,
                    label: 'Tanggal',
                    placeholder: '28 April 2024',
                    readOnly: true,
                    onTap: () async {
                      final DateTime? pickedDate =
                          await showCupertinoModalPopup(
                        context: context,
                        builder: (context) => Container(
                          color: Colors.white,
                          height: 216,
                          child: CupertinoDatePicker(
                            mode: CupertinoDatePickerMode.date,
                            initialDateTime: DateTime.now(),
                            onDateTimeChanged: (dateTime) {
                              _dateController.text =
                                  DateFormat('dd MMMM yyyy', 'id_ID')
                                      .format(dateTime);
                              setState(() {
                                _date = dateTime;
                              });
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: LabelInput(
                    controller: _timeController,
                    type: TextInputType.text,
                    label: 'Waktu',
                    placeholder: '09.00',
                    readOnly: true,
                    onTap: () async {
                      if (_date == null) return;
                      final TimeOfDay? pickedTime =
                          await showCupertinoModalPopup(
                        context: context,
                        builder: (context) => Container(
                          color: Colors.white,
                          height: 216,
                          child: CupertinoTimerPicker(
                            mode: CupertinoTimerPickerMode.hm,
                            initialTimerDuration: Duration(
                              hours: _date.hour,
                              minutes: _date.minute,
                            ),
                            onTimerDurationChanged: (timerDuration) {
                              _timeController.text = Duration(
                                hours: DateTime.now().hour,
                                minutes: DateTime.now().minute,
                              ).toString().split('.').first;

                              setState(() {
                                int totalMinutes = timerDuration.inMinutes;
                                int hours = totalMinutes ~/ 60;
                                int minutes = totalMinutes % 60;
                                _time = TimeOfDay(hour: hours, minute: minutes);
                              });

                              _timeController.text =
                                  timerDuration.toString().split('.').first;
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
              controller: _priceController,
              type: TextInputType.text,
              label: 'Harga',
              placeholder: 'e.g. 10.000',
            ),
            SizedBox(height: 50),
            Container(
              width: MediaQuery.of(context).size.width,
              child: TextButton(
                onPressed: _simpanOnTap,
                child: Text(
                  'Simpan',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600)),
                ),
                style: ButtonStyle(
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                    padding: WidgetStatePropertyAll(
                        EdgeInsets.symmetric(vertical: 20)),
                    backgroundColor: WidgetStatePropertyAll(primary)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
