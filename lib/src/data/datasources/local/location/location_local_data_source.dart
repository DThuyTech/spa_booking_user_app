import 'dart:convert';
import '../../../../core/storage/preferences_storage.dart';
import '../../../model/location/city_model.dart';

abstract interface class LocationLocalDataSource {
  Future<List<CityModel>?> getCachedCities();
  Future<void> cacheCities(List<CityModel> cities);
  Future<String?> getSelectedCity();
  Future<void> saveSelectedCity(String cityName);
}

class LocationLocalDataSourceImpl implements LocationLocalDataSource {
  static const _cachedCitiesKey = 'cached_locations_cities';
  static const _selectedCityKey = 'selected_location_city';

  final PreferencesStorage _preferences;

  const LocationLocalDataSourceImpl(this._preferences);

  @override
  Future<List<CityModel>?> getCachedCities() async {
    try {
      final raw = await _preferences.getString(_cachedCitiesKey);
      if (raw == null || raw.isEmpty) return null;
      final decoded = jsonDecode(raw);
      if (decoded is List) {
        return decoded
            .map(
              (item) =>
                  CityModel.fromJson(Map<String, dynamic>.from(item as Map)),
            )
            .toList();
      }
    } catch (_) {}
    return null;
  }

  @override
  Future<void> cacheCities(List<CityModel> cities) async {
    try {
      final encoded = jsonEncode(cities.map((c) => c.toJson()).toList());
      await _preferences.setString(_cachedCitiesKey, encoded);
    } catch (_) {}
  }

  @override
  Future<String?> getSelectedCity() async {
    return _preferences.getString(_selectedCityKey);
  }

  @override
  Future<void> saveSelectedCity(String cityName) async {
    await _preferences.setString(_selectedCityKey, cityName);
  }
}
