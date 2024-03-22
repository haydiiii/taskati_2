import 'package:hive_flutter/hive_flutter.dart';

class AppLocalStorage {
  static late Box userbox;
   static init() {
    userbox = Hive.box('user');
  }

  static cashData(key, value) {
    userbox.put(key, value);
  }

  getCashData(key) {
    return userbox.get(key);
  }
}
