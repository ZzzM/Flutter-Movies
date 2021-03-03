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
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Movies`
  String get tab_movies {
    return Intl.message(
      'Movies',
      name: 'tab_movies',
      desc: '',
      args: [],
    );
  }

  /// `TVs`
  String get tab_tvs {
    return Intl.message(
      'TVs',
      name: 'tab_tvs',
      desc: '',
      args: [],
    );
  }

  /// `Shows`
  String get tab_shows {
    return Intl.message(
      'Shows',
      name: 'tab_shows',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get tab_settings {
    return Intl.message(
      'Settings',
      name: 'tab_settings',
      desc: '',
      args: [],
    );
  }

  /// `Ranks`
  String get movies_ranks {
    return Intl.message(
      'Ranks',
      name: 'movies_ranks',
      desc: '',
      args: [],
    );
  }

  /// `Recommended`
  String get search_recommended {
    return Intl.message(
      'Recommended',
      name: 'search_recommended',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search_title {
    return Intl.message(
      'Search',
      name: 'search_title',
      desc: '',
      args: [],
    );
  }

  /// `Find Movies、TVs`
  String get search_find {
    return Intl.message(
      'Find Movies、TVs',
      name: 'search_find',
      desc: '',
      args: [],
    );
  }

  /// `Enter Keywords`
  String get search_hint {
    return Intl.message(
      'Enter Keywords',
      name: 'search_hint',
      desc: '',
      args: [],
    );
  }

  /// `Results`
  String get search_results {
    return Intl.message(
      'Results',
      name: 'search_results',
      desc: '',
      args: [],
    );
  }

  /// `Hot`
  String get tv_hot {
    return Intl.message(
      'Hot',
      name: 'tv_hot',
      desc: '',
      args: [],
    );
  }

  /// `Domestic`
  String get tv_domestic {
    return Intl.message(
      'Domestic',
      name: 'tv_domestic',
      desc: '',
      args: [],
    );
  }

  /// `American`
  String get tv_american {
    return Intl.message(
      'American',
      name: 'tv_american',
      desc: '',
      args: [],
    );
  }

  /// `Japanese`
  String get tv_japanese {
    return Intl.message(
      'Japanese',
      name: 'tv_japanese',
      desc: '',
      args: [],
    );
  }

  /// `Korean`
  String get tv_korean {
    return Intl.message(
      'Korean',
      name: 'tv_korean',
      desc: '',
      args: [],
    );
  }

  /// `Animation`
  String get tv_animation {
    return Intl.message(
      'Animation',
      name: 'tv_animation',
      desc: '',
      args: [],
    );
  }

  /// `Hot`
  String get show_hot {
    return Intl.message(
      'Hot',
      name: 'show_hot',
      desc: '',
      args: [],
    );
  }

  /// `Domestic`
  String get show_domestic {
    return Intl.message(
      'Domestic',
      name: 'show_domestic',
      desc: '',
      args: [],
    );
  }

  /// `Foreign`
  String get show_foreign {
    return Intl.message(
      'Foreign',
      name: 'show_foreign',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings_title {
    return Intl.message(
      'Settings',
      name: 'settings_title',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get settings_language {
    return Intl.message(
      'Language',
      name: 'settings_language',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get settings_about {
    return Intl.message(
      'About',
      name: 'settings_about',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get settings_theme {
    return Intl.message(
      'Theme',
      name: 'settings_theme',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get settings_theme_light {
    return Intl.message(
      'Light',
      name: 'settings_theme_light',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get settings_theme_dark {
    return Intl.message(
      'Dark',
      name: 'settings_theme_dark',
      desc: '',
      args: [],
    );
  }

  /// `Follow System`
  String get settings_theme_system {
    return Intl.message(
      'Follow System',
      name: 'settings_theme_system',
      desc: '',
      args: [],
    );
  }

  /// ` Seen`
  String get movie_seen {
    return Intl.message(
      ' Seen',
      name: 'movie_seen',
      desc: '',
      args: [],
    );
  }

  /// ` Scored`
  String get movie_scored {
    return Intl.message(
      ' Scored',
      name: 'movie_scored',
      desc: '',
      args: [],
    );
  }

  /// `None`
  String get movie_none_rating {
    return Intl.message(
      'None',
      name: 'movie_none_rating',
      desc: '',
      args: [],
    );
  }

  /// `Unrelease`
  String get movie_unrelease {
    return Intl.message(
      'Unrelease',
      name: 'movie_unrelease',
      desc: '',
      args: [],
    );
  }

  /// `Review`
  String get movie_review {
    return Intl.message(
      'Review',
      name: 'movie_review',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get movie_share {
    return Intl.message(
      'Share',
      name: 'movie_share',
      desc: '',
      args: [],
    );
  }

  /// `Summary`
  String get movie_summary {
    return Intl.message(
      'Summary',
      name: 'movie_summary',
      desc: '',
      args: [],
    );
  }

  /// `Directors / Actors`
  String get movie_casts {
    return Intl.message(
      'Directors / Actors',
      name: 'movie_casts',
      desc: '',
      args: [],
    );
  }

  /// `Director`
  String get movie_director {
    return Intl.message(
      'Director',
      name: 'movie_director',
      desc: '',
      args: [],
    );
  }

  /// `Trailers`
  String get movie_trailers {
    return Intl.message(
      'Trailers',
      name: 'movie_trailers',
      desc: '',
      args: [],
    );
  }

  /// `Comments`
  String get movie_comments {
    return Intl.message(
      'Comments',
      name: 'movie_comments',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get movie_comments_all {
    return Intl.message(
      'All',
      name: 'movie_comments_all',
      desc: '',
      args: [],
    );
  }

  /// `Recommended`
  String get movie_recommended {
    return Intl.message(
      'Recommended',
      name: 'movie_recommended',
      desc: '',
      args: [],
    );
  }

  /// `Photos`
  String get movie_photos {
    return Intl.message(
      'Photos',
      name: 'movie_photos',
      desc: '',
      args: [],
    );
  }

  /// `Release`
  String get movie_release {
    return Intl.message(
      'Release',
      name: 'movie_release',
      desc: '',
      args: [],
    );
  }

  /// `Genre`
  String get movie_genre {
    return Intl.message(
      'Genre',
      name: 'movie_genre',
      desc: '',
      args: [],
    );
  }

  /// `Duration`
  String get movie_duration {
    return Intl.message(
      'Duration',
      name: 'movie_duration',
      desc: '',
      args: [],
    );
  }

  /// `Region`
  String get movie_region {
    return Intl.message(
      'Region',
      name: 'movie_region',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get movie_language {
    return Intl.message(
      'Language',
      name: 'movie_language',
      desc: '',
      args: [],
    );
  }

  /// `Downloading...`
  String get file_downloading {
    return Intl.message(
      'Downloading...',
      name: 'file_downloading',
      desc: '',
      args: [],
    );
  }

  /// `Total:`
  String get file_total {
    return Intl.message(
      'Total:',
      name: 'file_total',
      desc: '',
      args: [],
    );
  }

  /// `Completed:`
  String get file_completed {
    return Intl.message(
      'Completed:',
      name: 'file_completed',
      desc: '',
      args: [],
    );
  }

  /// `No Permission to Access Album`
  String get file_permission {
    return Intl.message(
      'No Permission to Access Album',
      name: 'file_permission',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get file_cancel {
    return Intl.message(
      'Cancel',
      name: 'file_cancel',
      desc: '',
      args: [],
    );
  }

  /// `Save to Album`
  String get file_save {
    return Intl.message(
      'Save to Album',
      name: 'file_save',
      desc: '',
      args: [],
    );
  }

  /// `Download to Album`
  String get file_download {
    return Intl.message(
      'Download to Album',
      name: 'file_download',
      desc: '',
      args: [],
    );
  }

  /// `Open App Settings`
  String get file_settings {
    return Intl.message(
      'Open App Settings',
      name: 'file_settings',
      desc: '',
      args: [],
    );
  }

  /// `No Data`
  String get refresh_reload {
    return Intl.message(
      'No Data',
      name: 'refresh_reload',
      desc: '',
      args: [],
    );
  }

  /// `Reload`
  String get refresh_empty {
    return Intl.message(
      'Reload',
      name: 'refresh_empty',
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
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}