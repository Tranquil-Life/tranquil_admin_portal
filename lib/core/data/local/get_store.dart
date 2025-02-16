import 'package:get_storage/get_storage.dart';
import 'package:tranquil_admin_portal/core/data/local/i_store.dart';

GetStore getStore = GetStore();

class GetStore extends IStore {
  GetStorage getStorage = GetStorage();

  @override
  get(dynamic key) => getStorage.read(key);

  @override
  set(dynamic key, dynamic val) => getStorage.write(key, val);

  @override
  Future<void> clearAllData() => getStorage.erase();

  @override
  Future<void> addStringToList(String key, String value,
      {bool checkForLength = false}) async {
    List<String> strings = getStringList(key);

    if (checkForLength && strings.length >= 5) {
      strings.removeAt(0);
    }

    strings.add(value);
    await getStorage.write(key, strings);
  }

  @override
  List<String> getStringList(String key) {
    var data = getStorage.read(key);

    if (data is String) {
      return [data];
    } else if (data is List<dynamic>) {
      return data.cast<String>();
    }
    return [];
  }
}
