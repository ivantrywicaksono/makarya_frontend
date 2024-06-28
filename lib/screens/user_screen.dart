part of screens;

class UserScreen extends StatefulWidget {
  // final Artist artist;
  const UserScreen({
    super.key,
    // required this.artist,
  });

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
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
    int id = context.read<UserProvider>().artist.id;
    context.read<UserProvider>().getProfile();
    // if (id == widget.artist.id) {
    // print(id);
    // context.read<ArtistProvider>().get(id);
    // } else {
    // context.read<ArtistProvider>().getArtist(widget.artist.id);
    // }
    context.read<PublicationProvider>().getAll(id);
  }

  @override
  Widget build(BuildContext context) {
    Artist artist = context.watch<UserProvider>().artist;
    print(artist.id);
    print('userscreen');
    // context.read<PublicationProvider>().getAll(artist.id);
    // List<Publication> publications =
    //     context.read<PublicationProvider>().publications;
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
                  GestureDetector(
                    onTap: () => context.read<UserProvider>().getProfile(),
                    child: Row(
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
                        Text(
                          artist.name,
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Poppins'),
                        ),
                      ],
                    ),
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
                  // if (context.read<UserProvider>().artist.id == widget.artist.id)
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
                        context.go('/user/edit', extra: artist);
                      },
                      label: Text(
                        'Ubah Profil',
                        style: Utils.textRegular,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6.0),
                  // if (context.read<UserProvider>().artist.id == widget.artist.id)
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
                        // context.read<PublicationProvider>().getAll(context.read<UserProvider>().artist.id);
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
                }
              },
            ),
            // for (Publication publication in publications)
            //   PublikasiPost(
            //     publication: publication,
            //     onDeleteTap: () =>
            //         context.read<PublicationProvider>().delete(publication.id),
            //   )
          ],
        ),
      ),
    );
  }
}
