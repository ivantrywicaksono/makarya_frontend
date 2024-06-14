part of providers;

class EventProvider extends ChangeNotifier {
  late Event _event;
  Event get event => _event;

  List<Event> _events = [];
  List<Event> get events => _events;

  EventService _eventService = EventService();

  Future<Event> get(int id) async {
    try {
      Event eventsData = await _eventService.get(id);
      _event = eventsData;
      notifyListeners();
      return eventsData;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<Event>> getAll([int id = 0]) async {
    try {
      List<Event> eventsData = await _eventService.getAll(id);
      _events = eventsData;
      _event = await _eventService.getLatest();
      notifyListeners();
      return eventsData;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> create(Event newEvent, String path) async {
    try {
      await _eventService.create(newEvent, path);
      _events = await getAll();
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> delete(int id) async {
    try {
      await _eventService.delete(id);
      _events = await getAll();
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> update(Event event) async {
    try {
      await _eventService.update(event);
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }
}
