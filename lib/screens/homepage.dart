part of screens;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<Publication> popular;
  @override
  void initState() {
    super.initState();
    context.read<EventProvider>().getAll();
    popular = context.read<PublicationProvider>().getPopular();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => context.go('/edit-user'),
            icon: Icon(CupertinoIcons.person_crop_circle),
          ),
        ],
        title: Text("Beranda"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Heading(
              heading: "Acara",
              paragraph: "Acara teraktual dari komunitas",
            ),
            EventCard(event: context.watch<EventProvider>().event,),
            Divider(height: 24),
            Heading(
              heading: "Galeri Terpopuler",
              paragraph: "Kumpulan publikasi yang sedang populer",
            ),
            FutureBuilder<Publication>(
              future: popular,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData) {
                  return Text('No data');
                } else {
                  return PublikasiPost(
                    publication: snapshot.data!,
                    onDeleteTap: () {},
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
