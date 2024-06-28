part of services;

class PublicationService {
  Future<Publication> popular() async {
    final response = await http.get(
      Utils.getApiUri('/publication/popular'),
      headers: Utils.requestHeaders(),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data =
          jsonDecode(response.body) as Map<String, dynamic>;
      Publication popular = Publication.fromJson(data);
      return popular;
    } else {
      throw Exception(response.body);
    }
  }

  Future<Publication> get(int id) async {
    final response = await http.get(
      Utils.getApiUri('/publication/$id'),
      headers: Utils.requestHeaders(),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data =
          jsonDecode(response.body) as Map<String, dynamic>;
      Publication publication = Publication.fromJson(data);
      return publication;
    } else {
      throw Exception(response.body);
    }
  }

  Future<void> delete(int id) async {
    final response = await http.delete(
      Utils.getApiUri('/publication/$id'),
      headers: Utils.requestHeaders(),
    );

    if (response.statusCode == 200) {
    } else {
      throw Exception(response.body);
    }
  }

  Future<void> update(int id, String description) async {
    final response = await http.put(Utils.getApiUri('/publication/$id'),
        headers: Utils.requestHeaders(),
        body: jsonEncode({"description": description}));

    if (response.statusCode == 200) {
    } else {
      throw Exception(response.body);
    }
  }

  Future<void> create(Publication newPublication, String filepath) async {
    // var request = http.MultipartRequest('POST', Utils.getApiUri('/publication'))
    //   ..fields.addAll(newPublication.toMap());
    // ..headers.addAll(Utils.requestHeaders(contentType: 'multipart/form-data'))
    // ..files.add(await http.MultipartFile.fromPath('image', filepath));

    // var streamedResponse = await request.send();
    // var response = await http.Response.fromStream(streamedResponse);

    final response = await http.post(
      Utils.getApiUri('/publication/'),
      headers: Utils.requestHeaders(),
      body: jsonEncode(newPublication),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data =
          jsonDecode(response.body) as Map<String, dynamic>;

      Publication publicationData = Publication.fromJson(data);
      print(publicationData.image);
      // return publicationData;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception(response.body);
    }
  }

  Future<List<Publication>> getAll([int id = 0]) async {
    String endPoint = id > 0 ? '/publication/artist/$id' : '/publication';
    final response = await http.get(
      Utils.getApiUri(endPoint),
      headers: Utils.requestHeaders(),
    );

    if (response.statusCode == 200) {
      final parsed =
          (jsonDecode(response.body) as List).cast<Map<String, dynamic>>();

      List<Publication> publicationsData = parsed
          .map<Publication>((json) => Publication.fromJson(json))
          .toList();

      return publicationsData;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception(response.body);
    }
  }

  // Future<User> getProfile(User user) async {}
  // Future<User> editProfile(User user) async {}
}
