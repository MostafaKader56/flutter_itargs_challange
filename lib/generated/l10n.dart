// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `No data available.`
  String get no_data_exsist {
    return Intl.message(
      'No data available.',
      name: 'no_data_exsist',
      desc: '',
      args: [],
    );
  }

  /// `Oops! Something went wrong.`
  String get oops {
    return Intl.message(
      'Oops! Something went wrong.',
      name: 'oops',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message(
      'Retry',
      name: 'retry',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get Home {
    return Intl.message(
      'Home',
      name: 'Home',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get More {
    return Intl.message(
      'More',
      name: 'More',
      desc: '',
      args: [],
    );
  }

  /// `This is App`
  String get Home_title {
    return Intl.message(
      'This is App',
      name: 'Home_title',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get More_title {
    return Intl.message(
      'More',
      name: 'More_title',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get Settings {
    return Intl.message(
      'Settings',
      name: 'Settings',
      desc: '',
      args: [],
    );
  }

  /// `Arabic Language`
  String get Arabic_language {
    return Intl.message(
      'Arabic Language',
      name: 'Arabic_language',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get dark_mode {
    return Intl.message(
      'Dark Mode',
      name: 'dark_mode',
      desc: '',
      args: [],
    );
  }

  /// `Top Likes`
  String get top_likes {
    return Intl.message(
      'Top Likes',
      name: 'top_likes',
      desc: '',
      args: [],
    );
  }

  /// `Listen Audios`
  String get listen_audios {
    return Intl.message(
      'Listen Audios',
      name: 'listen_audios',
      desc: '',
      args: [],
    );
  }

  /// `Play This`
  String get play_this {
    return Intl.message(
      'Play This',
      name: 'play_this',
      desc: '',
      args: [],
    );
  }

  /// `Loading and Cashing mp3 file...`
  String get loading_mp3 {
    return Intl.message(
      'Loading and Cashing mp3 file...',
      name: 'loading_mp3',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok {
    return Intl.message(
      'Ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Error While Downloading Mp3 File.`
  String get error_with_loading_mp3 {
    return Intl.message(
      'Error While Downloading Mp3 File.',
      name: 'error_with_loading_mp3',
      desc: '',
      args: [],
    );
  }

  /// `Data loaded from local databese`
  String get data_is_from_local {
    return Intl.message(
      'Data loaded from local databese',
      name: 'data_is_from_local',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
