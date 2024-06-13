part of services;

class PublicationService {
  Future<void> create(Publication newPublication, String filepath) async {
    // final response = await http.post(
    //   Utils.getApiUri('/publication'),
    //   headers: Utils.requestHeaders(contentType: 'multipart/form-data'),
    //   body: jsonEncode(newPublication),
    // );

    var request = http.MultipartRequest('POST', Utils.getApiUri('/publication'))
      ..fields.addAll(newPublication.toMap())
      ..headers.addAll(Utils.requestHeaders(contentType: 'multipart/form-data'))
      ..files.add(await http.MultipartFile.fromPath('image', filepath));

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      print(data);

      Publication publicationData = Publication.fromJson(data);
      print(publicationData);

      // return publicationData;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception(response.body);
    }
  }

  Future<List<Publication>> getAll() async {
    final response = await http.get(
      Utils.getApiUri('/publication'),
      headers: Utils.requestHeaders(),
    );

    if (response.statusCode == 200) {
      final parsed =
          (jsonDecode(response.body) as List).cast<Map<String, dynamic>>();

      print(parsed);
      List<Publication> publicationsData = parsed
          .map<Publication>((json) => Publication.fromJson(json))
          .toList();

      // print(publicationsData[0].likes?.length);

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
