part of services;

class ArtistService {
  Future<Artist> get(int id) async {
    final response = await http.get(
      Utils.getApiUri('/artist/$id'),
      headers: Utils.requestHeaders(),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      print(data);

      Artist artist = Artist.fromJson(data);
      return artist;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception(response.body);
    }
  }
}
