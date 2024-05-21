import 'package:flutter/material.dart';

class DetailKomunitas extends StatefulWidget {
  const DetailKomunitas({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DetailKomunitasState createState() => _DetailKomunitasState();
}

class _DetailKomunitasState extends State<DetailKomunitas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        leading: Theme(
          data: Theme.of(context).copyWith(
            iconTheme: const IconThemeData(color: Colors.white),
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              // handle back button press
            },
          ),
        ),
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
    body: SingleChildScrollView(
  child: Column(
    children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
        child: Column(
          children: [
            const Row(
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundImage: AssetImage('assets/Ellipse 1.png'),
                ),
                SizedBox(width: 16),
                Text('Canting Creative', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400, fontFamily: 'Poppins')),
              ],
            ),
            const SizedBox(height: 5),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(1, 117, 97, 1)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    // jika button kedua diklik, kode di sini
                  },
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.logout, size: 16, color: Colors.white),
                      SizedBox(width: 4),
                      Text('Gabung ke Grup Whatsapp',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Poppins',
                      )),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
            const Text('Kami adalah sebuah komunitas yang bersemangat dalam menghidupkan kembali keindahan tradisi batik melalui sentuhan kreatif kontemporer. Dengan jalinan antara seniman, desainer, dan pecinta batik dari berbagai latar belakang, kami tidak hanya mengenang warisan budaya, tetapi juga merayakan inovasi dalam seni tekstil. Bersama-sama, kami menjelajahi teknik-tradisional dan eksperimen daring untuk menciptakan karya-karya unik yang mencerahkan cerita-cerita baru dalam setiap helai kain.',
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.normal,
              fontFamily: 'Poppins',
            ),
            textAlign: TextAlign.justify,
            ),
            const Divider(
              color: Colors.black,
              height: 40,
              thickness: 1,
              indent: 0,
              endIndent: 0,
            ),
          ],
        ),
      ),
    ],
  ),
));
  }
}
