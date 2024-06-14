part of providers;

class PublicationProvider extends ChangeNotifier {
  late Publication _popular;
  Publication get popular => _popular;
  late Publication _publication;
  Publication get publication => _publication;

  List<Publication> _publications = [];
  List<Publication> get publications => _publications;

  PublicationService _publicationService = PublicationService();

  Future<Publication> getPopular() async {
    try {
      Publication publicationsData = await _publicationService.popular();
      _popular = publicationsData;
      notifyListeners();
      return publicationsData;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Publication> get(int id) async {
    try {
      Publication publicationsData = await _publicationService.get(id);
      _publication = publicationsData;
      notifyListeners();
      return publicationsData;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<Publication>> getAll() async {
    try {
      List<Publication> publicationsData = await _publicationService.getAll();
      _publications = publicationsData;
      notifyListeners();
      return publicationsData;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> create(Publication newPublication, String path) async {
    try {
      await _publicationService.create(newPublication, path);
      _publications = await getAll();
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> delete(int id) async {
    try {
      await _publicationService.delete(id);
      _publications = await getAll();
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> update(int id, String description) async {
    try {
      await _publicationService.update(id, description);
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }
}
