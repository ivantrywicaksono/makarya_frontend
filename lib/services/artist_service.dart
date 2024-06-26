part of services;

class ArtistService {
  Future<Artist> get(int id) async {
    final response = await http.get(
      Utils.getApiUri('/artist/$id'),
      headers: Utils.requestHeaders(),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;

      Artist artist = Artist.fromJson(data);
      return artist;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception(response.body);
    }
  }
  Future<Artist> getArtist(int id) async {
    final response = await http.get(
      Utils.getApiUri('/artist/get/$id'),
      headers: Utils.requestHeaders(),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;

      Artist artist = Artist.fromJson(data);
      return artist;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception(response.body);
    }
  }

  Future<void> update(Artist artist) async {
    final response = await http.put(
      Utils.getApiUri('/artist/${artist.id}'),
      headers: Utils.requestHeaders(),
      body: jsonEncode(artist)
    );

    if (response.statusCode == 200) {
    } else {
      throw Exception(response.body);
    }
  }
}
