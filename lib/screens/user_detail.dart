part of screens;

class UserDetail extends StatefulWidget {
  final Artist artist;
  const UserDetail({super.key, required this.artist});

  @override
  _UserDetailState createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  @override
  void initState() {
    super.initState();
    context.read<PublicationProvider>().getAll(widget.artist.id);
  }

  @override
  Widget build(BuildContext context) {
    Artist artist = widget.artist;
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
