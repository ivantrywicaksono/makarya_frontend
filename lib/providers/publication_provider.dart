part of providers;

class PublicationProvider extends ChangeNotifier {
  late Publication _publication;
  Publication get publication => _publication;

  List<Publication> _publications = [];
  List<Publication> get publications => _publications;

  PublicationService _publicationService = PublicationService();

  Future<void> getAll() async {
    try {
      List<Publication> publicationsData = await _publicationService.getAll();
      _publications = publicationsData;
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> create(Publication newPublication, String path) async {
    try {
      await _publicationService.create(newPublication, path);
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }
}
