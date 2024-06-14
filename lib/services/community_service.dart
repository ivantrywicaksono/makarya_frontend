part of services;

class CommunityService {
  Future<List<Community>> getAll() async {
    final response = await http.get(
      Utils.getApiUri('/community'),
      headers: Utils.requestHeaders(),
    );

    if (response.statusCode == 200) {
      final parsed =
          (jsonDecode(response.body) as List).cast<Map<String, dynamic>>();

      print(parsed);
      List<Community> communitiesData = parsed
          .map<Community>((json) => Community.fromJson(json))
          .toList();

      // print(communitysData[0].likes?.length);

      return communitiesData;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception(response.body);
    }
  }

  Future<Community> get(int id) async {
    final response = await http.get(
      Utils.getApiUri('/community/$id'),
      headers: Utils.requestHeaders(),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      print(data);

      Community community = Community.fromJson(data);
      return community;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception(response.body);
    }
  }

  Future<Community> update(Community community) async {
    final response = await http.put(
      Utils.getApiUri('/community/${community.id}'),
      headers: Utils.requestHeaders(),
      body: jsonEncode(community)
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      print(data);

      Community community = Community.fromJson(data);
      return community;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception(response.body);
    }
  }
}
