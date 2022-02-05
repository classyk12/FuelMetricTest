import 'dart:convert';

import 'package:get_storage/get_storage.dart';

class Storage {
  //this retrieves the token from local storage
  static Future<dynamic> read(String key) async {
    final storage = GetStorage();
    var value = await storage.read(key);
    if (value != null) {
      return jsonDecode(value);
    }
    return null;
  }

  static Future<bool> getKey(String key) async {
    final storage = GetStorage();
    return storage.hasData(key);
  }

  static Future<String> getToken() async {
    final storage = GetStorage();
    var value = storage.read('token');
    if (value != null) {
      return value;
    }
    return '';
  }

//this saves decoded token into local storage
  static Future<bool> save(String key, dynamic value) async {
    if (value != null) {
      final storage = GetStorage();
      var encodeValue = jsonEncode(value);
      await storage.write(key, encodeValue);
      return true;
    }
    return false;
  }

//this removes a specified local storage value from storage
  static Future remove(String key) async {
    final storage = GetStorage();
    await storage.remove(key);
  }

//this clears all local storage values
  static Future clearAll() async {
    final storage = GetStorage();
    await storage.erase();
  }
}
