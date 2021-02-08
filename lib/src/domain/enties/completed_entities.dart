import 'package:birth_days_app/src/domain/interactors/inter_helpers.dart';
import 'package:birth_days_app/src/utils/locale_helper/l10n.dart';

import 'entities.dart';

class CompletedEvent {
  final EventEntity _event;
  final PersonEntity person;
  final GroupEntity personGroup;

  CompletedEvent(this._event,this.person,this.personGroup);

  int get id => _event.id;
  String get name => _event.name;
  DateTime get date => _event.date;

  EventTypes get eventType => _event.eventType;

  DateTime get eventRepeatDate {
    EventEntity evRaw=_event;
    evRaw.date=new DateTime(DateTime.now().year, evRaw.date.month, evRaw.date.day);

    if (evRaw.date.day<DateTime.now().day || evRaw.date.month<DateTime.now().month) {
      final DateTime tmpDate=DateTime(DateTime.now().year,evRaw.date.month,evRaw.date.day);
      final int diff=DateTime.now().difference(tmpDate).inDays;
      if (diff>2) evRaw.date=new DateTime(DateTime.now().year + 1, evRaw.date.month, evRaw.date.day);
      else evRaw.date=new DateTime(DateTime.now().year, evRaw.date.month, evRaw.date.day);
    } else {
      evRaw.date=new DateTime(DateTime.now().year, evRaw.date.month, evRaw.date.day);
    }

    return evRaw.date;
  }

  String get eventTypeName {
    if (_event.eventType==EventTypes.birth) return S.current.com_birthDay;
    else return _event.name;
  }

}

class CompletedPerson {
  final List<EventEntity> events;
  final EventEntity birthday;
  final PersonEntity _person;
  final GroupEntity group;

  CompletedPerson(this.events,this._person,this.group,this.birthday);

  int get id => _person.id;
  String get name => _person.name;
  int get age {
    if (birthday!=null) {
      var res=DateTime.now().year - birthday.date.year;
      //TODO нормальный возраст
      /*if (res>0) return res;

      res=DateTime.now().month- birthday.date.month;
      if (res>0) return res;

      res=DateTime.now().day - birthday.date.day;*/
      return res;

    } else {
      return null;
    }
  }
  String get sign {
    return SignHelper.getSignFromDate(birthday.date);
  }

  String get chinaSign {
    return SignHelper.getYearSignFromDate(birthday.date);
  }

}