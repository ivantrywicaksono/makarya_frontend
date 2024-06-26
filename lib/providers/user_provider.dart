part of providers;

class UserProvider extends ChangeNotifier {
  late User _user;
  User get user => _user;

  late Artist _artist = Artist(id: 0);
  Artist get artist => _artist;
  late Community _community = Community(id: 0);
  Community get community => _community;

  late String _role;
  String? get role => user.role;

  UserService _userService = UserService();
  ArtistService _artistService = ArtistService();
  CommunityService _communityService = CommunityService();

  void logout() {
    _role = '';
    _artist = Artist(id: 0);
    _community = Community(id: 0);
    _user = User(id: 0, name: '', email: '', role: '');
    notifyListeners();
  }

  Future<void> register(User newUser, String phone) async {
    try {
      User userData = await _userService.register(newUser, phone);
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> login(User user) async {
    try {
      User userData = await _userService.login(user);
      _user = userData;

      if (userData.role == 'Artist') {
        Artist artistData = await _artistService.get(userData.id);
        _artist = artistData;
      } else if (userData.role == 'Community') {
        Community communityData = await _communityService.get(userData.id);
        _community = communityData;
      }
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Artist> getProfile() async {
    Artist artistData = await _artistService.get(_user.id);
    _artist = artistData;
    notifyListeners();
    return artistData;
  }
}
