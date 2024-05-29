part of screens;

class LihatPengajuan extends StatelessWidget {
  const LihatPengajuan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pengajuan',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/pengajuan/create'),
        backgroundColor: Utils.primaryColor,
        child: Icon(
          CupertinoIcons.add,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Lihat Pengajuan Haki',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                  color: Utils.primaryColor, // Warna coklat
                ),
              ),
              const SizedBox(height: 16.0),
              // SvgPicture.asset('assets/images/papuma_bahagia.svg'), // Di-comment atau hapus jika tidak digunakan
              const SizedBox(height: 16.0),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(16.0), // Padding dalam kotak
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.brown), // Garis tepi kotak
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Keindahan Pantai Salomon di Wilayah Jember',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      const Text(
                        'Dengan keindahan yang dikagumi berbagai kalangan, sekarang pantai sedang ditata agar semakin indah.',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
