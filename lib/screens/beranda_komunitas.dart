part of screens;

class BerandaKomunitas extends StatefulWidget {
  const BerandaKomunitas({super.key});

  @override
  _BerandaKomunitasState createState() => _BerandaKomunitasState();
}

class _BerandaKomunitasState extends State<BerandaKomunitas> {
  @override
  void initState() {
    super.initState();
    context.read<UserProvider>().getProfile();

    context
        .read<EventProvider>()
        .getAll(context.read<UserProvider>().community.id);
  }

  @override
  Widget build(BuildContext context) {
    Community community = context.watch<UserProvider>().community;
    // context.watch<EventProvider>().events;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Komunitas",
          style: Utils.textStyle(
            color: Colors.white,
            size: 22.0,
          ),
        ),
        backgroundColor: const Color.fromRGBO(58, 24, 5, 1),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 32,
                        backgroundImage: CachedNetworkImageProvider(
                          '${Utils.baseUrl}storage/${community.image}',
                        ),
                      ),
                      SizedBox(width: 16),
                      Text(community.name,
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Poppins')),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    community.description,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Poppins',
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 16.0),
                  Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                        color: Utils.primaryColor,
                      ),
                    ),
                    child: TextButton.icon(
                      icon: Icon(
                        Icons.edit_square,
                        color: Utils.primaryColor,
                        size: 20,
                      ),
                      onPressed: () {
                        context.go('/home-komunitas/editprofile/',
                            extra: community);
                      },
                      label: Text(
                        'Ubah Profil Komunitas',
                        style: Utils.textRegular,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6.0),
                  Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(229, 0, 0, 1),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: TextButton.icon(
                      icon: Icon(
                        Icons.logout,
                        color: Colors.white,
                        size: 20,
                      ),
                      onPressed: () {
                        // context.read<EventProvider>().getAll(context.read<UserProvider>().community.id);
                        context.read<UserProvider>().logout();
                        context.go('/login');
                      },
                      label: Text(
                        'Keluar',
                        style: Utils.textStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 6.0),
                ],
              ),
            ),
            const Divider(
              color: Colors.black,
              height: 40,
              thickness: 1,
              indent: 25,
              endIndent: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 12),
                  // width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(0, 148, 15, 1),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: TextButton.icon(
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 20,
                    ),
                    onPressed: () {
                      context.go('/home-komunitas/create/');
                    },
                    label: Text(
                      'Tambah',
                      style: Utils.textStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            FutureBuilder<List<Event>>(
              future: context.read<EventProvider>().getAll(community.id),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData) {
                  return Text('No data');
                } else {
                  return Column(children: [
                    for (Event e in snapshot.data!)
                      EventCard(
                          event: e,
                          onDeleteTap: () {
                            context.read<EventProvider>().delete(e.id);
                            setState(() {});
                          })
                  ]);
                }
              },
            ),
            // for (Event event in events)
            //   EventCard(
            //     event: event,
            //   )
          ],
        ),
      ),
    );
  }
}
