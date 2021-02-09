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

  /// `Empty`
  String get com_Empty {
    return Intl.message(
      'Empty',
      name: 'com_Empty',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get com_Error {
    return Intl.message(
      'Error',
      name: 'com_Error',
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

  /// `January`
  String get dateMonth_Jan {
    return Intl.message(
      'January',
      name: 'dateMonth_Jan',
      desc: '',
      args: [],
    );
  }

  /// `February`
  String get dateMonth_Feb {
    return Intl.message(
      'February',
      name: 'dateMonth_Feb',
      desc: '',
      args: [],
    );
  }

  /// `March`
  String get dateMonth_Mar {
    return Intl.message(
      'March',
      name: 'dateMonth_Mar',
      desc: '',
      args: [],
    );
  }

  /// `April`
  String get dateMonth_Apr {
    return Intl.message(
      'April',
      name: 'dateMonth_Apr',
      desc: '',
      args: [],
    );
  }

  /// `May`
  String get dateMonth_May {
    return Intl.message(
      'May',
      name: 'dateMonth_May',
      desc: '',
      args: [],
    );
  }

  /// `June`
  String get dateMonth_Jun {
    return Intl.message(
      'June',
      name: 'dateMonth_Jun',
      desc: '',
      args: [],
    );
  }

  /// `July`
  String get dateMonth_Jul {
    return Intl.message(
      'July',
      name: 'dateMonth_Jul',
      desc: '',
      args: [],
    );
  }

  /// `August`
  String get dateMonth_Aug {
    return Intl.message(
      'August',
      name: 'dateMonth_Aug',
      desc: '',
      args: [],
    );
  }

  /// `September`
  String get dateMonth_Sep {
    return Intl.message(
      'September',
      name: 'dateMonth_Sep',
      desc: '',
      args: [],
    );
  }

  /// `October`
  String get dateMonth_Oct {
    return Intl.message(
      'October',
      name: 'dateMonth_Oct',
      desc: '',
      args: [],
    );
  }

  /// `November`
  String get dateMonth_Nov {
    return Intl.message(
      'November',
      name: 'dateMonth_Nov',
      desc: '',
      args: [],
    );
  }

  /// `December`
  String get dateMonth_Dec {
    return Intl.message(
      'December',
      name: 'dateMonth_Dec',
      desc: '',
      args: [],
    );
  }

  /// `Capricorn`
  String get dateSign_1 {
    return Intl.message(
      'Capricorn',
      name: 'dateSign_1',
      desc: '',
      args: [],
    );
  }

  /// `Aquarius`
  String get dateSign_2 {
    return Intl.message(
      'Aquarius',
      name: 'dateSign_2',
      desc: '',
      args: [],
    );
  }

  /// `Pisces`
  String get dateSign_3 {
    return Intl.message(
      'Pisces',
      name: 'dateSign_3',
      desc: '',
      args: [],
    );
  }

  /// `Aries`
  String get dateSign_4 {
    return Intl.message(
      'Aries',
      name: 'dateSign_4',
      desc: '',
      args: [],
    );
  }

  /// `Taurus`
  String get dateSign_5 {
    return Intl.message(
      'Taurus',
      name: 'dateSign_5',
      desc: '',
      args: [],
    );
  }

  /// `Gemini`
  String get dateSign_6 {
    return Intl.message(
      'Gemini',
      name: 'dateSign_6',
      desc: '',
      args: [],
    );
  }

  /// `Cancer`
  String get dateSign_7 {
    return Intl.message(
      'Cancer',
      name: 'dateSign_7',
      desc: '',
      args: [],
    );
  }

  /// `Leo`
  String get dateSign_8 {
    return Intl.message(
      'Leo',
      name: 'dateSign_8',
      desc: '',
      args: [],
    );
  }

  /// `Virgo`
  String get dateSign_9 {
    return Intl.message(
      'Virgo',
      name: 'dateSign_9',
      desc: '',
      args: [],
    );
  }

  /// `Libra`
  String get dateSign_10 {
    return Intl.message(
      'Libra',
      name: 'dateSign_10',
      desc: '',
      args: [],
    );
  }

  /// `Scorpio`
  String get dateSign_11 {
    return Intl.message(
      'Scorpio',
      name: 'dateSign_11',
      desc: '',
      args: [],
    );
  }

  /// `Capricorn`
  String get dateSign_12 {
    return Intl.message(
      'Capricorn',
      name: 'dateSign_12',
      desc: '',
      args: [],
    );
  }

  /// `Monkey`
  String get dateChinaSign_1 {
    return Intl.message(
      'Monkey',
      name: 'dateChinaSign_1',
      desc: '',
      args: [],
    );
  }

  /// `Rooster`
  String get dateChinaSign_2 {
    return Intl.message(
      'Rooster',
      name: 'dateChinaSign_2',
      desc: '',
      args: [],
    );
  }

  /// `Dog`
  String get dateChinaSign_3 {
    return Intl.message(
      'Dog',
      name: 'dateChinaSign_3',
      desc: '',
      args: [],
    );
  }

  /// `Pig`
  String get dateChinaSign_4 {
    return Intl.message(
      'Pig',
      name: 'dateChinaSign_4',
      desc: '',
      args: [],
    );
  }

  /// `Rat`
  String get dateChinaSign_5 {
    return Intl.message(
      'Rat',
      name: 'dateChinaSign_5',
      desc: '',
      args: [],
    );
  }

  /// `Boole`
  String get dateChinaSign_6 {
    return Intl.message(
      'Boole',
      name: 'dateChinaSign_6',
      desc: '',
      args: [],
    );
  }

  /// `Tiger`
  String get dateChinaSign_7 {
    return Intl.message(
      'Tiger',
      name: 'dateChinaSign_7',
      desc: '',
      args: [],
    );
  }

  /// `Rabbit`
  String get dateChinaSign_8 {
    return Intl.message(
      'Rabbit',
      name: 'dateChinaSign_8',
      desc: '',
      args: [],
    );
  }

  /// `Dragon`
  String get dateChinaSign_9 {
    return Intl.message(
      'Dragon',
      name: 'dateChinaSign_9',
      desc: '',
      args: [],
    );
  }

  /// `Snake`
  String get dateChinaSign_10 {
    return Intl.message(
      'Snake',
      name: 'dateChinaSign_10',
      desc: '',
      args: [],
    );
  }

  /// `Horse`
  String get dateChinaSign_11 {
    return Intl.message(
      'Horse',
      name: 'dateChinaSign_11',
      desc: '',
      args: [],
    );
  }

  /// `Goat`
  String get dateChinaSign_12 {
    return Intl.message(
      'Goat',
      name: 'dateChinaSign_12',
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