import 'package:tranquil_admin_portal/core/data/local/get_store.dart';
import 'package:tranquil_admin_portal/features/profile/domain/repos/user_data_store.dart';

abstract class Keys {
  static const user = 'user';
}

UserDataStore userDataStore = UserDataStore();

class UserDataStore extends IUserDataStore {
  @override
  Map<String, dynamic> get user =>
      getStore.get(Keys.user) ?? <String, dynamic>{};

  @override
  set user(Map<String, dynamic> val) {
    Map<String, dynamic> currentUser = user;
    updateMap(currentUser, val);
    getStore.set(Keys.user, currentUser);
  }

  void updateMap(Map<String, dynamic> targetMap, Map<String, dynamic> updates) {
    updates.forEach((key, value) {
      targetMap.update(key, (existingValue) => value, ifAbsent: () => value);
    });
  }
}
