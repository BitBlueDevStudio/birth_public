import 'dart:developer';
import 'package:birth_days_app/src/data/person_event_repository.dart';
import 'package:birth_days_app/src/domain/enties/entities.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocState extends Equatable {
  AppBlocState(this.locale);
  final String locale;

  @override
  List<Object> get props => [locale];
}

enum AppBlocEvent { refreshed, themeChanged, languageChanged }

class AppBloc extends Bloc<AppBlocEvent, AppBlocState> {
  String userLocale;
  AppBloc(this.userLocale) : super(AppBlocState(userLocale));

  //TODO удалить
  void initTestData() async {
    EventPersonsRepository rep = EventPersonsRepository();
    await rep.addGroup(new GroupEntity(id: -1, name: "Друзья"));
    await rep.addGroup(new GroupEntity(id: -1, name: "Близкие"));
    int g=await rep.addGroup(new GroupEntity(id: -1, name: "Работа"));

    int p=await rep.addPerson(PersonEntity(
      name: "sa",
      groupId: g
    ));
    await rep.addEvent(EventEntity(
      eventType: EventTypes.birth,
      personId: p,
      name: "др",
      date: DateTime.now()
    ));

    await rep.addEvent(EventEntity(
        eventType: EventTypes.other,
        personId: p,
        name: "День X",
        date: DateTime.now().add(Duration(days: 10))
    ));

  }

  @override
  Stream<AppBlocState> mapEventToState(AppBlocEvent event) async* {
    if (event==AppBlocEvent.refreshed) {
      log("message");
      //yield(AppBlocState(userLocale));
      //initTestData();
    }
  }

}

