part of screens;

class UserDetail extends StatefulWidget {
  final Artist artist;
  const UserDetail({
    super.key,
    required this.artist,
  });

  @override
  _UserDetailState createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  Future<String> getImageUrl(String path) async {
    try {
      return await FirebaseStorage.instance.ref().child(path).getDownloadURL();
    } catch (e) {
      print('Error getting download URL for $path: $e');
      return await FirebaseStorage.instance
          .ref()
          .child('profile/profile.jpg')
          .getDownloadURL();
    }
  }

  @override
  void initState() {
    super.initState();
    // context.read<PublicationProvider>().getAll(widget.artist.id);
  }

  @override
  Widget build(BuildContext context) {
    Artist artist = widget.artist;
    print(artist.id);
    // List<Publication> publications =
    //     context.watch<PublicationProvider>().publications;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profil",
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
                      FutureBuilder<String>(
                        future: getImageUrl(artist.image),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else if (!snapshot.hasData) {
                            return Text('No data');
                          } else {
                            return CircleAvatar(
                              backgroundImage:
                                  CachedNetworkImageProvider(snapshot.data!),
                              radius: 32,
                            );
                          }
                        },
                      ),
                      SizedBox(width: 16),
                      Text(artist.name,
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Poppins')),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    artist.description,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Poppins',
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 16.0),
                ],
              ),
            ),
            SizedBox(height: 12),
            FutureBuilder<List<Publication>>(
              future: context.read<PublicationProvider>().getAll(artist.id),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData) {
                  return Text('No data');
                } else {
                  return Column(children: [
                    for (Publication p in snapshot.data!)
                      PublikasiPost(
                        publication: p,
                        onDeleteTap: () =>
                            context.read<PublicationProvider>().delete(p.id),
                      )
                  ]);

                  // return PublikasiPost(
                  //   publication: snapshot.data!,
                  //   onDeleteTap: () {},
                  // );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
