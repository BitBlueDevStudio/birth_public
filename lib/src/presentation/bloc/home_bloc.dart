import 'dart:async';

import 'package:birth_days_app/src/domain/enties/completed_entities.dart';
import 'package:birth_days_app/src/domain/enties/entities.dart';
import 'package:birth_days_app/src/domain/interactors/home_list_interactor.dart';
import 'package:birth_days_app/src/presentation/dto/home_list/home_list_dto.dart';

import 'package:birth_days_app/src/presentation/dto/home_list/list_item_data_object.dart';
import 'package:birth_days_app/src/utils/locale_helper/l10n.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/interactors/interactor_helpers.dart';
import 'package:intl/intl.dart';



//MainHomeBloc

enum HomeTabState { home, calendar, third, menu }

abstract class MainHomeEvent extends Equatable {
  const MainHomeEvent();
}

class NavUpdated extends MainHomeEvent  {
  final HomeTabState tab;

  NavUpdated(this.tab);

  @override
  List<Object> get props => [tab];
  
}

class ItemAddedOrChanged extends MainHomeEvent  {
  final List<PersonEntity> persons;
  final List<EventEntity> events;

  ItemAddedOrChanged(this.persons,this.events);

  @override
  List<Object> get props => [];
}

class MainHomeBloc extends Bloc<MainHomeEvent, HomeTabState> {
  final HomeListBloc eventsBloc;
  final HomeListBloc peopleBloc;
  final HomeCalendarBloc calendarBloc;
  double scrolled=0;
  double scrolled2=0;

  MainHomeBloc(this.eventsBloc,this.calendarBloc,this.peopleBloc) : super(HomeTabState.home);


  @override
  Stream<HomeTabState> mapEventToState(MainHomeEvent event) async* {
    if (event is NavUpdated) {
      yield event.tab;
    } else if (event is ItemAddedOrChanged) {
      if (event.events!=null && (event.events.isNotEmpty || event.events.isNotEmpty))
        this.eventsBloc.add(HomeListEventLoad());
      if (event.persons!=null && (event.persons.isNotEmpty || event.events.isNotEmpty))
        this.peopleBloc.add(HomeListEventLoad());
      //todo написать метод рефреша элементов списка без полного сброса
    }
  }

  @override Future<void> close() {
    eventsBloc.close();
    peopleBloc.close();
    calendarBloc.close();
    return super.close();
  }
}

//HomeListBloc

abstract class HomeListEvent extends Equatable {
  HomeListEvent();

  @override
  List<Object> get props => [];
}

abstract class HomeListState extends Equatable {
  HomeListState();

  @override
  List<Object> get props => [];
}

class HomeListEventLoad extends HomeListEvent {}

class HomeListEventAdded extends HomeListEvent {}

class HomeListEventUpdated extends HomeListEvent {}

class HomeListItemDeleted extends HomeListEvent {
  final int id;
  final MainHomeBloc mainBloc;
  HomeListItemDeleted(
      this.id,this.mainBloc
      );
}

class HomeListEventFiltered extends HomeListEvent {}

class HomeListEventClicked extends HomeListEvent {}


class HomeListStateLoaded extends HomeListState {
  final List listItems;
  final double homeListScroll;
  HomeListStateLoaded([this.listItems = const [],this.homeListScroll]);

  @override
  List<Object> get props => [listItems,homeListScroll];
}

class HomeListStateLoading extends HomeListState {}

class HomeListStateError extends HomeListState {
  final String error;
  HomeListStateError(
      this.error
      );
}
class HomeListStateEmpty extends HomeListState {}

class HomeListBloc extends Bloc<HomeListEvent, HomeListState> {

  final HomeListInteractor interactor;
  final bool isPeople;
  HomeListBloc(this.interactor,this.isPeople) : super(HomeListStateLoading());

  @override
  Stream<HomeListState> mapEventToState(HomeListEvent event) async* {
    if (event is HomeListEventLoad && !isPeople) {
      //yield HomeListStateLoading();
      try {
        final List<CompletedEvent> rawEventList=await interactor.getEvents();
        List<ListDataEvent> listEventsData = [];
        for (int i = 0; i < rawEventList.length; i++) {
          var evRaw=rawEventList[i];

          ListDataPersonBase per=ListDataPersonBase(
            id:evRaw.person.id,
            name: evRaw.person.name,
            group: evRaw.personGroup
          );

          ListDataEvent ev=ListDataEvent(
            id: evRaw.id,
            man:per,
            name: evRaw.eventTypeName,
            eventType: evRaw.eventType,
            date: evRaw.eventRepeatDate,
            //TODO формат даты
            dateText: DateFormat('dd.MM.yyyy').format(evRaw.date)
          );

          listEventsData.add(ev);

        }
        if (listEventsData.length > 0) {
          listEventsData.sort(
                  (a, b) => a.date.compareTo(b.date)
          );

          List<ListItemDataObject> listData = [];

          if (listEventsData[0].date.difference(DateTime.now()).inDays<0) {
            listData.add(ListDataEventTitle(S.current.listEvent_Recents, listEventsData[0].date));
          }
          else if (listEventsData[0].date.difference(DateTime.now()).inDays==0) {
            listData.add(ListDataEventTitle(S.current.com_Today, listEventsData[0].date));
          }
          else if (listEventsData[0].date.difference(DateTime.now()).inDays>0 && listEventsData[0].date.month!=DateTime.now().month) {
            listData.add(ListDataEventTitle(DateHelper.getMonthName(listEventsData[0].date)+" "+listEventsData[0].date.year.toString() , listEventsData[0].date));
          } else if (listEventsData[0].date.difference(DateTime.now()).inDays>0 && listEventsData[0].date.month==DateTime.now().month) {
            listData.add(ListDataEventTitle(DateHelper.getMonthName(listEventsData[0].date)+" "+listEventsData[0].date.year.toString() , listEventsData[0].date));
          }

          listData.add(listEventsData[0]);

          for (int i=1;i<listEventsData.length;i++) {

              var next=listEventsData[i];
              var prev=listEventsData[i-1];

              if (prev.date.day != next.date.day && next.date.difference(DateTime.now()).inDays<0) {
                listData.add(ListDataEventTitle(S.current.listEvent_Recents, next.date));
              }
              else if (prev.date.day != next.date.day && next.date.difference(DateTime.now()).inDays==0) {
                listData.add(ListDataEventTitle(S.current.com_Today, next.date));
              }
              else if (prev.date.day != next.date.day && ((next.date.difference(DateTime.now()).inDays>0 && next.date.month!=DateTime.now().month) || (prev.date.difference(DateTime.now()).inDays==0) )) {
                listData.add(ListDataEventTitle(DateHelper.getMonthName(next.date)+" "+next.date.year.toString() , next.date));
            }
              listData.add(listEventsData[i]);
          }
          yield HomeListStateLoaded(listData);
        }
        else
          yield HomeListStateEmpty();
      } catch (Exception){
        yield HomeListStateError(Exception.toString());
      }
    }
    else if (event is HomeListEventLoad && isPeople) {
      //yield HomeListStateLoading();
      try {
        final List<CompletedPerson> rawPersonList=await interactor.getPersons();

        List<ListDataPerson> listPersonsData = [];
        for (int i = 0; i < rawPersonList.length; i++) {

          var perRaw=rawPersonList[i];

          ListDataPerson per=ListDataPerson(
            id: perRaw.id,
            name: perRaw.name,
            group: (perRaw.group!=null) ? perRaw.group : GroupEntity(name: ""),
            birth: (perRaw.birthday!=null) ? perRaw.birthday.date : null,
            sign: perRaw.sign,
            yearSign: perRaw.chinaSign,
            age: perRaw.age,
            birthText: (perRaw.birthday!=null) ? DateFormat('dd.MM.yyyy').format(perRaw.birthday.date) : S.current.com_Unknown
          );

          listPersonsData.add(per);
        }
        if (listPersonsData.length > 0) {
          yield HomeListStateLoaded(listPersonsData);
        }
        else
          yield HomeListStateEmpty();
      } catch (Exception){
        yield HomeListStateError(Exception.toString());
      }
    }
    else if (event is HomeListItemDeleted && !isPeople) {
      int deleted=await interactor.deleteEvent(event.id);
      if (deleted==1) this.add(HomeListEventLoad());
      else yield HomeListStateError("Error deleting element");

    }
    else if (event is HomeListItemDeleted && isPeople) {
      int deleted=await interactor.deletePerson(event.id);
      if (deleted==1) {
        this.add(HomeListEventLoad());
        event.mainBloc.eventsBloc.add(HomeListEventLoad());
      }
      else yield HomeListStateError("Error deleting element");

    }
    /*if (event is HomeListEventClicked) {

    }*/
  }
}


//HomeCalendarBloc

abstract class HomeCalendarEvent extends Equatable {
  HomeCalendarEvent();

  @override
  List<Object> get props => [];
}

class HomeCalendarState extends Equatable {
  HomeCalendarState();

  @override
  List<Object> get props => [];
}

class HomeCalendarBloc extends Bloc<HomeCalendarEvent, HomeCalendarState> {
  HomeCalendarBloc() : super(HomeCalendarState());

  @override
  Stream<HomeCalendarState> mapEventToState(HomeCalendarEvent event) async* {

  }
}
