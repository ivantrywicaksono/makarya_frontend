part of screens;

class UpdateEventScreen extends StatefulWidget {
  final String title;
  final Event event;

  const UpdateEventScreen({
    super.key,
    required this.title,
    required this.event,
  });

  @override
  State<UpdateEventScreen> createState() => _UpdateEventScreenState();
}

class _UpdateEventScreenState extends State<UpdateEventScreen> {
  late TextEditingController _nameController = TextEditingController();
  late TextEditingController _locationController = TextEditingController();
  late TextEditingController _dateController = TextEditingController();
  late TextEditingController _timeController = TextEditingController();
  late TextEditingController _priceController = TextEditingController();

  late DateTime _date;
  late TimeOfDay _time;
  Future<String> getImageUrl(String path) async {
    try {
      return await FirebaseStorage.instance.ref().child(path).getDownloadURL();
    } catch (e) {
      print('Error getting download URL for $path: $e');
      return await FirebaseStorage.instance
          .ref()
          .child('event/noimage.png')
          .getDownloadURL();
    }
  }

  @override
  void initState() {
    super.initState();
    _date = widget.event.date;
    _time = widget.event.time;
    _nameController = TextEditingController(text: widget.event.name);
    _locationController = TextEditingController(text: widget.event.location);
    _dateController = TextEditingController(
        text: DateFormat('dd MMMM yyyy', 'id_ID').format(widget.event.date));
    _timeController = TextEditingController(
        text:
            "${widget.event.time.hour.toString().padLeft(2, '0')}:${widget.event.time.minute.toString().padLeft(2, '0')}:00");
    _priceController =
        TextEditingController(text: widget.event.price.toString());
  }

  void _simpanOnTap() {
    // return print(context.read<UserProvider>().community.id);
    Event updatedEvent = Event(
      id: widget.event.id,
      community_id: context.read<UserProvider>().community.id,
      name: _nameController.text,
      location: _locationController.text,
      image: '',
      date: _date,
      time: _time,
      price: int.parse(_priceController.text),
    );
    context.read<EventProvider>().update(updatedEvent);
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
            FutureBuilder<String>(
              future: getImageUrl(widget.event.image),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData) {
                  return Text('No data');
                } else {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 18),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: CachedNetworkImage(
                        imageUrl: snapshot.data!,
                      ),
                    ),
                  );
                }
              },
            ),
            SizedBox(height: 12),
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
                            initialDateTime: widget.event.date,
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
                      final TimeOfDay? pickedTime =
                          await showCupertinoModalPopup(
                        context: context,
                        builder: (context) => Container(
                          color: Colors.white,
                          height: 216,
                          child: CupertinoTimerPicker(
                            mode: CupertinoTimerPickerMode.hm,
                            initialTimerDuration: Duration(
                              hours: widget.event.time.hour,
                              minutes: widget.event.time.minute,
                            ),
                            onTimerDurationChanged: (timerDuration) {
                              _timeController.text =
                                  timerDuration.toString().split('.').first;

                              setState(() {
                                int totalMinutes = timerDuration.inMinutes;
                                int hours = totalMinutes ~/ 60;
                                int minutes = totalMinutes % 60;
                                _time = TimeOfDay(hour: hours, minute: minutes);
                              });
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
              type: TextInputType.number,
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
