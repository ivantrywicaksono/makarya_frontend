part of widgets;

class PublikasiPost extends StatefulWidget {
  final Publication publication;
  void Function() onDeleteTap;

  PublikasiPost({
    super.key,
    required this.publication,
    required this.onDeleteTap,
  });

  @override
  State<PublikasiPost> createState() => _PublikasiPostState();
}

class _PublikasiPostState extends State<PublikasiPost> {
  bool _isLiked = false;
  // late String imageUrl = '';
  // @override
  // void initState() {
  //   super.initState();

  //   setImageUrl(widget.publication.image);
  // }
  Future<String> getImageUrl(String path) async {
    try {
      return await FirebaseStorage.instance.ref().child(path).getDownloadURL();
    } catch (e) {
      print('Error getting download URL for $path: $e');
      return await FirebaseStorage.instance
          .ref()
          .child('publication/noimage.png')
          .getDownloadURL();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(),
        PublikasiHead(
          publication: widget.publication,
          onDeleteTap: widget.onDeleteTap,
        ),
        FutureBuilder<String>(
          future: getImageUrl(widget.publication.image),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData) {
              return Text('No data');
            } else {
              return CachedNetworkImage(
                imageUrl: snapshot.data!,
              );
            }
          },
        ),
        // CachedNetworkImage(
        //   imageUrl: imageUrl,
        // ),
        PublikasiTail(
          publication_id: widget.publication.id,
          nLikes: widget.publication.likes,
          nComments: widget.publication.comments?.length ?? 0,
          likeOnPressed: _toggleLike,
          isLiked: _isLiked,
          date: widget.publication.created_at,
          description: widget.publication.description,
        ),
        Divider(),
      ],
    );
  }

  void _toggleLike() {
    setState(() {
      _isLiked = !_isLiked;
    });
  }

  // Future<void> setImageUrl(String path) async {
  //   final url =
  //       await FirebaseStorage.instance.ref().child(path).getDownloadURL();

  //   setState(() {
  //     imageUrl = url;
  //   });
  // }
}
