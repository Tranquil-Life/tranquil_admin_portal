abstract class IStore {
  set (dynamic key, dynamic val);
  get (dynamic key);
  Future<void> clearAllData();
  Future<void> addStringToList(String key, String value);
  List<String> getStringList(String key);
}