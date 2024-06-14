part of services;

class UserService {
  Future<User> register(User newUser, String phone) async {
    String email = newUser.email;
    String password= newUser.password;
    String name = newUser.name;
    String role = newUser.role;

    Map<String, dynamic> body = {
      "email": email,
      "password": password,
      "name": name,
      "role": role,
      "phone_number": phone,
    };

    final response = await http.post(
      Utils.getApiUri('/regist'),
      headers: Utils.requestHeaders(),
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;


      var {
        'id': id as int,
        'name': name as String,
        'email': email as String,
      } = data;

      String role = data['roles'][0]['name'] as String;

      User userData = User.fromJson(
        id: id,
        name: name,
        email: email,
        role: role,
      );

      return userData;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Gagal mendaftar');
    }
  }

  Future<User> login(User user) async {
    final response = await http.post(
      Utils.getApiUri('/login'),
      headers: Utils.requestHeaders(),
      body: jsonEncode(user),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map;

      var {
        'id': id as int,
        'name': name as String,
        'email': email as String,
      } = data['user'];

      String role = data['user']['roles'][0]['name'] as String;

      User userData = User.fromJson(
        id: id,
        name: name,
        email: email,
        role: role,
      );

      return userData;
    } else {
      throw Exception('Gagal');
    }
  }

  // Future<User> getProfile(User user) async {}
  // Future<User> editProfile(User user) async {}
}
