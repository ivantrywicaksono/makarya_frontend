part of screens;

class KomunitasListPage extends StatelessWidget {
  KomunitasListPage({super.key});

  final List<Komunitas> _komunitas = [
    Komunitas(
      nama: 'Canting Creative',
      deskripsi:
          'Kami adalah sebuah komunitas yang bersemangat dalam menghidupkan kembali keindahan tradisi batik melalui sentuhan kreatif kontemporer. Dengan jalinan antara seniman, des...',
      foto: "assets/images/e1.png",
    ),
    Komunitas(
      nama: 'Batik Nusantara',
      deskripsi:
          'Kami adalah pangkalan kreatif yang menghidupkan kembali keajaiban dan keindahan warisan budaya Indonesia melalui seni batik. Di sini, kami menyatukan para seniman, desainer, dan pe',
      foto: "assets/images/e2.png",
    ),
    Komunitas(
      nama: 'Kompahat',
      deskripsi:
          'Kami adalah wadah bagi para seniman pahat dari berbagai latar belakang dan gaya untuk bersatu dalam penciptaan, eksplorasi, dan apresiasi seni pahat.',
      foto: "assets/images/e3.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Komunitas",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontFamily: 'Poppins',
          ),
        ),
        backgroundColor: const Color.fromRGBO(58, 24, 5, 1),
      ),
      body: ListView.builder(
        itemCount: _komunitas.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              KomunitasCard(komunitas: _komunitas[index]),
            ],
          );
        },
      ),
    );
  }
}

class KomunitasCard extends StatefulWidget {
  const KomunitasCard({
    super.key,
    required this.komunitas,
  });

  final Komunitas komunitas;

  @override
  State<KomunitasCard> createState() => _KomunitasCardState();
}

class _KomunitasCardState extends State<KomunitasCard> {
  bool _isFollowed = false;

  void _toggleFollower() {
    setState(() {
      _isFollowed = !_isFollowed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.white,
      margin: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 16,
      ),
      color: Colors.white,
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: Colors.black),
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(widget.komunitas.foto),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Text(
                    widget.komunitas.nama,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ],
            ),
            Text(
              widget.komunitas.deskripsi,
              style: const TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.normal,
                fontFamily: 'Poppins',
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10.0),
                FollowMeButton(
                    onPressed: _toggleFollower, isFollowed: _isFollowed),
                const SizedBox(width: 10.0),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromRGBO(58, 24, 5, 1)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                  onPressed: () => context.go('/komunitas/1'),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.logout, size: 14, color: Colors.white),
                      SizedBox(width: 4),
                      Text('Kunjungi',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Poppins',
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
