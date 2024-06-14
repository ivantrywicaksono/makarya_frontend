part of screens;

class DetailKomunitas extends StatefulWidget {
  const DetailKomunitas({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DetailKomunitasState createState() => _DetailKomunitasState();
}

class _DetailKomunitasState extends State<DetailKomunitas> {
  // @override
  // void initState() {
  //   super.initState();
  //   Community c = GoRouterState.of(context).extra as Community;
  //   context.read<EventProvider>().getAll(c.id);
  // }

  void _launchURL(String url) async {
    Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    Community community = GoRouterState.of(context).extra as Community;
    context.read<EventProvider>().getAll(community.id);
    List<Event> events = context.read<EventProvider>().events;

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
                            '${Utils.baseUrl}storage/${community.image}',
                          ),
                        ),
                        SizedBox(width: 16),
                        Text(community.name,
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Poppins')),
                      ],
                    ),
                    const SizedBox(height: 5),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                            const Color.fromRGBO(1, 117, 97, 1)),
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                      onPressed: () {
                        // context.go('/komunitas/1/edit');
                        _launchURL(community.group_link);
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
                    Text(
                      community.description,
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
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Acara',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    for (Event event in events)
                      EventCard(event: event)
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
