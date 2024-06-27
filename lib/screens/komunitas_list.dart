part of screens;

class KomunitasListPage extends StatefulWidget {
  KomunitasListPage({super.key});

  @override
  State<KomunitasListPage> createState() => _KomunitasListPageState();
}

class _KomunitasListPageState extends State<KomunitasListPage> {
  @override
  void initState() {
    super.initState();
    context.read<CommunityProvider>().getAll();
  }

  @override
  Widget build(BuildContext context) {
    List<Community> communities =
        context.watch<CommunityProvider>().communities;

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
        itemCount: communities.length,
        itemBuilder: (context, index) {
          return KomunitasCard(
            community: communities[index],
          );
        },
      ),
    );
  }
}

class KomunitasCard extends StatefulWidget {
  const KomunitasCard({
    super.key,
    required this.community,
  });

  final Community community;

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
                FutureBuilder<String>(
                  future: getImageUrl(widget.community.image),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
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
                const SizedBox(width: 16.0),
                Expanded(
                  child: Text(
                    widget.community.name,
                    style: Utils.textStyle(
                      size: 20,
                      weight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Text(
              widget.community.description,
              style: Utils.textStyle(size: 15.0),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // FollowMeButton(
                //   onPressed: _toggleFollower,
                //   isFollowed: _isFollowed,
                // ),
                // const SizedBox(width: 10.0),
                Expanded(
                  child: InkWell(
                    overlayColor: WidgetStatePropertyAll(Utils.primaryColor),
                    borderRadius: BorderRadius.circular(12),
                    child: TextButton.icon(
                      style: TextButton.styleFrom(
                        backgroundColor: Utils.primaryColor,
                      ),
                      onPressed: () => context.go(
                          '/komunitas/${widget.community.id}',
                          extra: widget.community),
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
