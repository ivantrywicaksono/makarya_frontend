part of providers;

class ArtistProvider extends ChangeNotifier {
  late Artist _artist;
  Artist get artist => _artist;

  ArtistService _artistService = ArtistService();

  Future<Artist> get(int id) async {
    try {
      Artist artistsData = await _artistService.get(id);
      _artist = artistsData;
      notifyListeners();
      return artistsData;
    } catch (e) {
      throw Exception(e);
    }
  }
  Future<Artist> getArtist(int id) async {
    try {
      Artist artistsData = await _artistService.getArtist(id);
      _artist = artistsData;
      notifyListeners();
      return artistsData;
    } catch (e) {
      throw Exception(e);
    }
  }
}
