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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(widget.komunitas.foto),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Text(
                    widget.komunitas.nama,
                    style: Utils.textStyle(
                      size: 20,
                      weight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            Text(
              widget.komunitas.deskripsi,
              style: Utils.textStyle(size: 15.0),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FollowMeButton(
                  onPressed: _toggleFollower,
                  isFollowed: _isFollowed,
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: InkWell(
                    overlayColor: MaterialStatePropertyAll(Utils.primaryColor),
                    borderRadius: BorderRadius.circular(12),
                    child: TextButton.icon(
                      style: TextButton.styleFrom(
                        backgroundColor: Utils.primaryColor,
                      ),
                      onPressed: () => context.go('/komunitas/1'),
                      icon: Icon(
                        Icons.logout,
                        size: 14,
                        color: Colors.white,
                      ),
                      label: Text(
                        'Kunjungi',
                        style: Utils.textStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
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
