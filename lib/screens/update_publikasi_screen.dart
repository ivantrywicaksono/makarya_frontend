part of screens;

class UpdatePublikasiScreen extends StatefulWidget {
  final String title;

  const UpdatePublikasiScreen({super.key, required this.title});

  @override
  State<UpdatePublikasiScreen> createState() => _UpdatePublikasiScreenState();
}

class _UpdatePublikasiScreenState extends State<UpdatePublikasiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
    );
  }
}
