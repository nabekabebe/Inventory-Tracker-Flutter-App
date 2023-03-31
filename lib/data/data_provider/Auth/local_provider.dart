import 'dart:convert';

import 'package:inventory_tracker/data/dto/user.dto.dart';
import 'package:inventory_tracker/domain/entity/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  late final SharedPreferences _pref;

  SessionManager(this._pref);

  static const USER_TOKEN = "user_token";
  static const USER_ID = "user_id";
  static const USER_LOGIN = "user_login";
  static const USER = "user";
  static const IS_MANAGER = "is_manager";
  static const IS_NEW_USER = "is_new_user";

  Future<void> saveToken(String token) async =>
      await _pref.setString(USER_TOKEN, token);

  Future<void> saveUserId(int userId) async =>
      await _pref.setInt(USER_ID, userId);

  Future<void> saveUser(User user) async =>
      await _pref.setString(USER, jsonEncode(user));

  Future<void> setIsManager(bool isManager) async =>
      await _pref.setBool(IS_MANAGER, isManager);

  String? buildAuthToken() => _pref.getString(USER_TOKEN);

  String? getToken() => _pref.getString(USER_TOKEN);

  int? getUserId() => _pref.getInt(USER_ID);

  bool get isManager => _pref.getBool(IS_MANAGER) ?? false;

  bool isUserLoggedIn() {
    var token = _pref.getString(USER_TOKEN);
    if (token == null) return false;
    return true;
  }

  User? getLoggedInUser() {
    String? user = _pref.getString(USER);
    if (user == null) return null;
    return UserDto.fromJson(jsonDecode(user)).toUserEntity();
  }

  void signOut() {
    _pref.remove(USER);
    _pref.remove(USER_TOKEN);
    _pref.remove(USER_ID);
    _pref.remove(USER_LOGIN);
  }

  bool isNew() => _pref.getBool(IS_NEW_USER) ?? true;

  Future<void> removeNewUser() async => await _pref.setBool(IS_NEW_USER, false);
}
