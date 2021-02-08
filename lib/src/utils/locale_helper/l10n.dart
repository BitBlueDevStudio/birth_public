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

  /// `HB`
  String get appName {
    return Intl.message(
      'HB',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get frag1Title {
    return Intl.message(
      'Home',
      name: 'frag1Title',
      desc: '',
      args: [],
    );
  }

  /// `Calendar`
  String get frag2Title {
    return Intl.message(
      'Calendar',
      name: 'frag2Title',
      desc: '',
      args: [],
    );
  }

  /// `People`
  String get frag3Title {
    return Intl.message(
      'People',
      name: 'frag3Title',
      desc: '',
      args: [],
    );
  }

  /// `Menu`
  String get screen_MenuTitle {
    return Intl.message(
      'Menu',
      name: 'screen_MenuTitle',
      desc: '',
      args: [],
    );
  }

  /// `Not selected`
  String get com_NotSelected {
    return Intl.message(
      'Not selected',
      name: 'com_NotSelected',
      desc: '',
      args: [],
    );
  }

  /// `Unknown`
  String get com_Unknown {
    return Intl.message(
      'Unknown',
      name: 'com_Unknown',
      desc: '',
      args: [],
    );
  }

  /// `Date select`
  String get com_DateSelect {
    return Intl.message(
      'Date select',
      name: 'com_DateSelect',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get com_Back {
    return Intl.message(
      'Back',
      name: 'com_Back',
      desc: '',
      args: [],
    );
  }

  /// `Add {item}`
  String com_Add(Object item) {
    return Intl.message(
      'Add $item',
      name: 'com_Add',
      desc: '',
      args: [item],
    );
  }

  /// `Select {item}`
  String com_Select(Object item) {
    return Intl.message(
      'Select $item',
      name: 'com_Select',
      desc: '',
      args: [item],
    );
  }

  /// `Not found`
  String get com_notFound {
    return Intl.message(
      'Not found',
      name: 'com_notFound',
      desc: '',
      args: [],
    );
  }

  /// `Create new`
  String get com_CreateNew {
    return Intl.message(
      'Create new',
      name: 'com_CreateNew',
      desc: '',
      args: [],
    );
  }

  /// `Import`
  String get com_Import {
    return Intl.message(
      'Import',
      name: 'com_Import',
      desc: '',
      args: [],
    );
  }

  /// `Today`
  String get com_Today {
    return Intl.message(
      'Today',
      name: 'com_Today',
      desc: '',
      args: [],
    );
  }

  /// `Birth day`
  String get com_birthDay {
    return Intl.message(
      'Birth day',
      name: 'com_birthDay',
      desc: '',
      args: [],
    );
  }

  /// `New contact`
  String get form_Add_title {
    return Intl.message(
      'New contact',
      name: 'form_Add_title',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get form_Add_fName {
    return Intl.message(
      'Name',
      name: 'form_Add_fName',
      desc: '',
      args: [],
    );
  }

  /// `Group`
  String get form_Add_fGroup {
    return Intl.message(
      'Group',
      name: 'form_Add_fGroup',
      desc: '',
      args: [],
    );
  }

  /// `Birth day`
  String get form_Add_Birth {
    return Intl.message(
      'Birth day',
      name: 'form_Add_Birth',
      desc: '',
      args: [],
    );
  }

  /// `Event`
  String get form_Add_Event {
    return Intl.message(
      'Event',
      name: 'form_Add_Event',
      desc: '',
      args: [],
    );
  }

  /// `Add event`
  String get form_Add_AddEvent {
    return Intl.message(
      'Add event',
      name: 'form_Add_AddEvent',
      desc: '',
      args: [],
    );
  }

  /// `Add contact`
  String get form_Add_Submit {
    return Intl.message(
      'Add contact',
      name: 'form_Add_Submit',
      desc: '',
      args: [],
    );
  }

  /// `Select contact`
  String get form_Add_Ev_fMan {
    return Intl.message(
      'Select contact',
      name: 'form_Add_Ev_fMan',
      desc: '',
      args: [],
    );
  }

  /// `Title of event`
  String get form_AddEvent_fTitle {
    return Intl.message(
      'Title of event',
      name: 'form_AddEvent_fTitle',
      desc: '',
      args: [],
    );
  }

  /// `Date of event`
  String get form_AddEvent_fDate {
    return Intl.message(
      'Date of event',
      name: 'form_AddEvent_fDate',
      desc: '',
      args: [],
    );
  }

  /// `Group title`
  String get form_AddGroupName {
    return Intl.message(
      'Group title',
      name: 'form_AddGroupName',
      desc: '',
      args: [],
    );
  }

  /// `Enter name`
  String get formError_Add_fName {
    return Intl.message(
      'Enter name',
      name: 'formError_Add_fName',
      desc: '',
      args: [],
    );
  }

  /// `Enter title `
  String get formError_AddEvent_fTitle {
    return Intl.message(
      'Enter title ',
      name: 'formError_AddEvent_fTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter date`
  String get formError_AddEvent_fDate {
    return Intl.message(
      'Enter date',
      name: 'formError_AddEvent_fDate',
      desc: '',
      args: [],
    );
  }

  /// `Recent events`
  String get listEvent_Recents {
    return Intl.message(
      'Recent events',
      name: 'listEvent_Recents',
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
      Locale.fromSubtags(languageCode: 'ru', countryCode: 'RU'),
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