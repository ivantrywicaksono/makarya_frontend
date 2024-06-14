part of screens;

class UserScreen extends StatefulWidget {
  final Artist artist;
  const UserScreen({super.key, required this.artist});

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  void initState() {
    super.initState();
    int id = context.read<UserProvider>().artist.id;
    // if (id == widget.artist.id) {
      // print(id);
      context.read<ArtistProvider>().get(id);
    // } else {
      // context.read<ArtistProvider>().getArtist(widget.artist.id);
    // }
    context.read<PublicationProvider>().getAll(widget.artist.id);
  }

  @override
  Widget build(BuildContext context) {
    Artist artist = context.read<UserProvider>().artist;
    print(artist.id);
    List<Publication> publications =
        context.watch<PublicationProvider>().publications;
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
                      CircleAvatar(
                        radius: 32,
                        backgroundImage: CachedNetworkImageProvider(
                          '${Utils.baseUrl}storage/${artist.image}',
                        ),
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
                  if (context.read<UserProvider>().artist.id ==
                      widget.artist.id)
                    // Container(
                    //   width: double.maxFinite,
                    //   decoration: BoxDecoration(
                    //     color: Colors.white,
                    //     borderRadius: BorderRadius.circular(12.0),
                    //     border: Border.all(
                    //       color: Utils.primaryColor,
                    //     ),
                    //   ),
                    //   child: TextButton.icon(
                    //     icon: Icon(
                    //       Icons.edit_square,
                    //       color: Utils.primaryColor,
                    //       size: 20,
                    //     ),
                    //     onPressed: () {},
                    //     label: Text(
                    //       'Ubah Profil',
                    //       style: Utils.textRegular,
                    //     ),
                    //   ),
                    // ),
                  const SizedBox(height: 6.0),
                  if (context.read<UserProvider>().artist.id ==
                      widget.artist.id)
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
            for (Publication publication in publications)
              PublikasiPost(
                publication: publication,
                onDeleteTap: () =>
                    context.read<PublicationProvider>().delete(publication.id),
              )
          ],
        ),
      ),
    );
  }
}
