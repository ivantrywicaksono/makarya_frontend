part of screens;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              paragraph: "Acara teraktual dari komunitas yang Anda ikuti",
            ),
            EventCard(),
            Divider(),
            Heading(
              heading: "Galeri Terpopuler",
              paragraph: "Kumpulan publikasi yang sedang populer",
            ),
            PublikasiPost(avatar: "assets/images/publikasi.png"),
          ],
        ),
      ),
    );
  }
}
