part of services;

class UserService {
  Future<User> register(User newUser) async {
    final response = await http.post(
      Utils.getApiUri('/regist'),
      headers: Utils.requestHeaders(''),
      body: jsonEncode(newUser),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      print(response.body);
      User userData = User.fromJson(data);
      print(userData);
      return userData;
      // return List.from(data);
      // return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Gagal mendaftar');
    }
  }
}
