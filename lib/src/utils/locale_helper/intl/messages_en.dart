// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static m0(item) => "Add ${item}";

  static m1(item) => "Select ${item}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "appName" : MessageLookupByLibrary.simpleMessage("HB"),
    "com_Add" : m0,
    "com_Back" : MessageLookupByLibrary.simpleMessage("Back"),
    "com_CreateNew" : MessageLookupByLibrary.simpleMessage("Create new"),
    "com_DateSelect" : MessageLookupByLibrary.simpleMessage("Date select"),
    "com_Import" : MessageLookupByLibrary.simpleMessage("Import"),
    "com_NotSelected" : MessageLookupByLibrary.simpleMessage("Not selected"),
    "com_Select" : m1,
    "com_Today" : MessageLookupByLibrary.simpleMessage("Today"),
    "com_Unknown" : MessageLookupByLibrary.simpleMessage("Unknown"),
    "com_birthDay" : MessageLookupByLibrary.simpleMessage("Birth day"),
    "com_notFound" : MessageLookupByLibrary.simpleMessage("Not found"),
    "formError_AddEvent_fDate" : MessageLookupByLibrary.simpleMessage("Enter date"),
    "formError_AddEvent_fTitle" : MessageLookupByLibrary.simpleMessage("Enter title "),
    "formError_Add_fName" : MessageLookupByLibrary.simpleMessage("Enter name"),
    "form_AddEvent_fDate" : MessageLookupByLibrary.simpleMessage("Date of event"),
    "form_AddEvent_fTitle" : MessageLookupByLibrary.simpleMessage("Title of event"),
    "form_AddGroupName" : MessageLookupByLibrary.simpleMessage("Group title"),
    "form_Add_AddEvent" : MessageLookupByLibrary.simpleMessage("Add event"),
    "form_Add_Birth" : MessageLookupByLibrary.simpleMessage("Birth day"),
    "form_Add_Ev_fMan" : MessageLookupByLibrary.simpleMessage("Select contact"),
    "form_Add_Event" : MessageLookupByLibrary.simpleMessage("Event"),
    "form_Add_Submit" : MessageLookupByLibrary.simpleMessage("Add contact"),
    "form_Add_fGroup" : MessageLookupByLibrary.simpleMessage("Group"),
    "form_Add_fName" : MessageLookupByLibrary.simpleMessage("Name"),
    "form_Add_title" : MessageLookupByLibrary.simpleMessage("New contact"),
    "frag1Title" : MessageLookupByLibrary.simpleMessage("Home"),
    "frag2Title" : MessageLookupByLibrary.simpleMessage("Calendar"),
    "frag3Title" : MessageLookupByLibrary.simpleMessage("People"),
    "listEvent_Recents" : MessageLookupByLibrary.simpleMessage("Recent events"),
    "screen_MenuTitle" : MessageLookupByLibrary.simpleMessage("Menu")
  };
}
