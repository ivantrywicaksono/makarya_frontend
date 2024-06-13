part of providers;

class UserProvider extends ChangeNotifier {
  late User _user;
  User get user => _user;

  late Artist _artist;
  Artist get artist => _artist;

  late String _role;
  String get role => user.role;

  UserService _userService = UserService();
  ArtistService _artistService = ArtistService();

  Future<void> register(User newUser) async {
    try {
      User userData = await _userService.register(newUser);
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> login(User user) async {
    try {
      User userData = await _userService.login(user);
      print(userData);
      Artist artistData = await _artistService.get(userData.id);
      print(artistData);
      _user = userData;
      _artist = artistData;
      print(_user.id);
      print(_artist.id);
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }
}
