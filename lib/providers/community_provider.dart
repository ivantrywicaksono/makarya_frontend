part of providers;

class CommunityProvider extends ChangeNotifier {
  late Community _community;
  Community get community => _community;

  List<Community> _communities = [];
  List<Community> get communities => _communities;

  CommunityService _communityService = CommunityService();

  Future<Community> get(int id) async {
    try {
      Community communitiesData = await _communityService.get(id);
      _community = communitiesData;
      notifyListeners();
      return communitiesData;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<Community>> getAll() async {
    try {
      List<Community> communitiesData = await _communityService.getAll();
      _communities = communitiesData;
      notifyListeners();
      return communitiesData;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> update(Community community) async {
    try {
      await _communityService.update(community);
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }
}
