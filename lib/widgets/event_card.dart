part of widgets;

class EventCard extends StatefulWidget {
  Event event;
  void Function() onDeleteTap;

  EventCard({
    super.key,
    required this.event,
    required this.onDeleteTap,
  });

  @override
  EventCardState createState() => EventCardState();
}

class EventCardState extends State<EventCard> {
  bool _isReminded = false;

  void _toggleReminder() {
    setState(() {
      _isReminded = !_isReminded;
    });
  }

  Future<String> getImageUrl(String path) async {
    final url =
        await FirebaseStorage.instance.ref().child(path).getDownloadURL();
    return url;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.white,
      margin: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 10,
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: CachedNetworkImageProvider(snapshot.data!),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  );
                }
              },
            ),

            SizedBox(
              height: 10,
            ),
            Text(
              widget.event.name,
              style: GoogleFonts.poppins(
                  textStyle:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            ),
            Row(
              children: [
                Icon(
                  Icons.my_location_outlined,
                ),
                SizedBox(width: 6),
                Text(
                  widget.event.location,
                  style: GoogleFonts.poppins(),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.calendar_today_outlined),
                SizedBox(width: 6),
                Text(
                  DateFormat('d MMMM yyyy HH:mm', 'id_ID')
                      .format(widget.event.getDateTime())
                      .toString(),
                  style: GoogleFonts.poppins(),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.payments_outlined),
                SizedBox(width: 6),
                Text(widget.event.price > 0
                    ? NumberFormat.currency(
                        locale: 'id_ID',
                        symbol: 'Rp',
                        decimalDigits: 0,
                      ).format(widget.event.price)
                    : "Gratis"),
              ],
            ),
            SizedBox(height: 10.0),
            // RemindMeButton(onPressed: _toggleReminder, isReminded: _isReminded),
            if (widget.event.community_id ==
                context.read<UserProvider>().community.id)
              Row(
                children: [
                  Expanded(
                    child: Container(
                      // width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(229, 0, 0, 1),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: TextButton.icon(
                        icon: Icon(
                          Icons.delete_forever,
                          color: Colors.white,
                          size: 20,
                        ),
                        onPressed: () {
                          widget.onDeleteTap();
                          // context.read<EventProvider>().delete(widget.event.id);
                        },
                        label: Text(
                          'Hapus',
                          style: Utils.textStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      // width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(22, 79, 225, 1),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: TextButton.icon(
                        icon: Icon(
                          Icons.edit_square,
                          color: Colors.white,
                          size: 20,
                        ),
                        onPressed: () {
                          context.go('/home-komunitas/edit/${widget.event.id}',
                              extra: widget.event);
                        },
                        label: Text(
                          'Ubah',
                          style: Utils.textStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
    );
  }
}
