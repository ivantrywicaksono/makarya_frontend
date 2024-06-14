part of services;

class EventService {
  Future<Event> get(int id) async {
    final response = await http.get(
      Utils.getApiUri('/event/$id'),
      headers: Utils.requestHeaders(),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data =
          jsonDecode(response.body) as Map<String, dynamic>;
      Event event = Event.fromJson(data);
      return event;
    } else {
      throw Exception(response.body);
    }
  }

  Future<void> delete(int id) async {
    final response = await http.delete(
      Utils.getApiUri('/event/$id'),
      headers: Utils.requestHeaders(),
    );

    if (response.statusCode == 200) {
    } else {
      throw Exception(response.body);
    }
  }

  Future<void> update(Event event) async {
    final response = await http.put(Utils.getApiUri('/event/${event.id}'),
        headers: Utils.requestHeaders(), body: jsonEncode(event.toMap()));

    if (response.statusCode == 200) {
    } else {
      throw Exception(response.body);
    }
  }

  Future<void> create(Event newEvent, String filepath) async {
    var request = http.MultipartRequest('POST', Utils.getApiUri('/event'))
      ..fields.addAll(newEvent.toMap())
      ..headers.addAll(Utils.requestHeaders(contentType: 'multipart/form-data'))
      ..files.add(await http.MultipartFile.fromPath('image', filepath));

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    if (response.statusCode == 200) {
      final Map<String, dynamic> data =
          jsonDecode(response.body) as Map<String, dynamic>;


      Event eventData = Event.fromJson(data);

      // return eventData;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception(response.body);
    }
  }

  Future<List<Event>> getAll([int id = 0]) async {
    String endPoint = id > 0 ? '/event/community/$id' : '/event';
    final response = await http.get(
      Utils.getApiUri(endPoint),
      headers: Utils.requestHeaders(),
    );

    if (response.statusCode == 200) {
      final parsed =
          (jsonDecode(response.body) as List).cast<Map<String, dynamic>>();

      List<Event> eventsData =
          parsed.map<Event>((json) => Event.fromJson(json)).toList();

      return eventsData;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception(response.body);
    }
  }
  Future<Event> getLatest() async {
    final response = await http.get(
      Utils.getApiUri('/event/latest'),
      headers: Utils.requestHeaders(),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data =
          jsonDecode(response.body) as Map<String, dynamic>;
      Event event = Event.fromJson(data);
      return event;
    } else {
      throw Exception(response.body);
    }
  }

  // Future<User> getProfile(User user) async {}
  // Future<User> editProfile(User user) async {}
}
