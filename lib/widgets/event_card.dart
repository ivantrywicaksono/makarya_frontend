part of widgets;

class EventCard extends StatefulWidget {
  const EventCard({super.key});

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
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/event.png'),
                ),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Pameran Batik",
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
                  "Bank Indonesia Jember",
                  style: GoogleFonts.poppins(),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.calendar_today_outlined),
                SizedBox(width: 6),
                Text(
                  "07 Mei 2024 09:00 WIB",
                  style: GoogleFonts.poppins(),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.payments_outlined),
                SizedBox(width: 6),
                Text("Gratis"),
              ],
            ),
            SizedBox(height: 10.0),
            // RemindMeButton(onPressed: _toggleReminder, isReminded: _isReminded),
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
    );
  }
}
