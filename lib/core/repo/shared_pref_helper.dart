import 'dart:convert';

import 'package:flutter_itargs_challange/features/main/data/model/load_audio_response/audio_file.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  static late final SharedPreferences prefs;
  static bool _isPrefInitialized = false;

  static Future<void> init() async {
    if (_isPrefInitialized) {
      return;
    }
    prefs = await SharedPreferences.getInstance().then((value) {
      _isPrefInitialized = true;
      return value;
    });
  }

  // SharedPref Keys
  static const String _langSuffixKey = '_langSuffixKey';
  static const String _tokenKey = '_tokenKey';
  static const String _darkModeKey = '_darkModeKey';
  static const String _audioFileKey = '_audioFileKey';

  static Future<void> setLangSuffix(String localeSuffix) async {
    prefs.setString(_langSuffixKey, localeSuffix);
  }

  static String? getLangSuffix() {
    return prefs.getString(_langSuffixKey);
  }

  static String? getToken() {
    return prefs.getString(_tokenKey);
  }

  static Future<void> setToken(String token) async {
    prefs.setString(_tokenKey, token);
  }

  static bool? getIsDarkMode() {
    return prefs.getBool(_darkModeKey);
  }

  static void setIsDarkMode(bool newIsDarkMode) {
    prefs.setBool(_darkModeKey, newIsDarkMode);
  }

  static Future<void> setAudioFile(AudioFile audioFile) async {
    await prefs.setString(_audioFileKey, json.encode(audioFile));
  }

  static AudioFile? getAudioFileFromPrefs() {
    final audioFileJson = prefs.getString(_audioFileKey);
    if (audioFileJson == null) {
      return null;
    }
    final Map<String, dynamic> jsonMap = json.decode(audioFileJson);
    return AudioFile.fromJson(jsonMap);
  }
}
