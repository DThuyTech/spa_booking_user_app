import 'package:shared_preferences/shared_preferences.dart';
import '../error/exceptions.dart';

abstract interface class PreferencesStorage {
  Future<String?> getString(String key);
  Future<void> setString(String key, String value);
  Future<bool?> getBool(String key);
  Future<void> setBool(String key, bool value);
  Future<int?> getInt(String key);
  Future<void> setInt(String key, int value);
  Future<void> remove(String key);
  Future<void> clear();
}

class SharedPreferencesImpl implements PreferencesStorage {
  final SharedPreferences _prefs;

  const SharedPreferencesImpl(this._prefs);

  static Future<SharedPreferencesImpl> init() async {
    final prefs = await SharedPreferences.getInstance();
    return SharedPreferencesImpl(prefs);
  }

  @override
  Future<String?> getString(String key) async {
    try {
      return _prefs.getString(key);
    } catch (e) {
      throw StorageException('Failed to read string from preferences: $e');
    }
  }

  @override
  Future<void> setString(String key, String value) async {
    try {
      await _prefs.setString(key, value);
    } catch (e) {
      throw StorageException('Failed to write string to preferences: $e');
    }
  }

  @override
  Future<bool?> getBool(String key) async {
    try {
      return _prefs.getBool(key);
    } catch (e) {
      throw StorageException('Failed to read bool from preferences: $e');
    }
  }

  @override
  Future<void> setBool(String key, bool value) async {
    try {
      await _prefs.setBool(key, value);
    } catch (e) {
      throw StorageException('Failed to write bool to preferences: $e');
    }
  }

  @override
  Future<int?> getInt(String key) async {
    try {
      return _prefs.getInt(key);
    } catch (e) {
      throw StorageException('Failed to read int from preferences: $e');
    }
  }

  @override
  Future<void> setInt(String key, int value) async {
    try {
      await _prefs.setInt(key, value);
    } catch (e) {
      throw StorageException('Failed to write int to preferences: $e');
    }
  }

  @override
  Future<void> remove(String key) async {
    try {
      await _prefs.remove(key);
    } catch (e) {
      throw StorageException('Failed to remove key from preferences: $e');
    }
  }

  @override
  Future<void> clear() async {
    try {
      await _prefs.clear();
    } catch (e) {
      throw StorageException('Failed to clear preferences: $e');
    }
  }
}
