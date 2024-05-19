part of screens;

class GaleriScreen extends StatelessWidget {
  GaleriScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Galeri"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PublikasiPost(),
            PublikasiPost(),
            PublikasiPost(),
          ],
        ),
      ),
    );
  }
}
