import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/storage/preferences_storage.dart';

class LocaleState extends Equatable {
  final Locale locale;

  const LocaleState(this.locale);

  bool get isVietnamese => locale.languageCode == 'vi';
  bool get isEnglish => locale.languageCode == 'en';

  @override
  List<Object?> get props => [locale];
}

class LocaleCubit extends Cubit<LocaleState> {
  static const String prefKey = 'app_language_code';
  static const Locale viLocale = Locale('vi');
  static const Locale enLocale = Locale('en');

  final PreferencesStorage _preferencesStorage;

  LocaleCubit(this._preferencesStorage) : super(const LocaleState(viLocale)) {
    _initLocale();
  }

  Future<void> _initLocale() async {
    try {
      final savedCode = await _preferencesStorage.getString(prefKey);
      if (savedCode != null && savedCode.isNotEmpty) {
        emit(LocaleState(Locale(savedCode)));
      } else {
        // Default to Vietnamese
        emit(const LocaleState(viLocale));
      }
    } catch (_) {
      emit(const LocaleState(viLocale));
    }
  }

  Future<void> setLocale(Locale newLocale) async {
    if (state.locale.languageCode == newLocale.languageCode) return;
    try {
      await _preferencesStorage.setString(prefKey, newLocale.languageCode);
    } catch (_) {}
    emit(LocaleState(newLocale));
  }

  Future<void> toggleLocale() async {
    final next = state.isVietnamese ? enLocale : viLocale;
    await setLocale(next);
  }
}
