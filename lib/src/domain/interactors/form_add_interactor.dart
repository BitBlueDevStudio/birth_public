import 'package:birth_days_app/src/data/person_event_repository.dart';
import 'package:birth_days_app/src/domain/enties/entities.dart';
import 'package:birth_days_app/src/presentation/bloc/home_bloc.dart';
import 'package:birth_days_app/src/utils/locale_helper/l10n.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

abstract class AddingEvent extends Equatable {
  AddingEvent();

  @override
  List<Object> get props => [];
}

class AddEvent extends AddingEvent {
  final List<EventEntity> events;

  AddEvent(this.events) : assert(events!=null,events.length>0);

  @override
  List<Object> get props => [events];
}

class AddPerson extends AddingEvent {
  final PersonEntity person;
  final List<EventEntity> events;
  final FormBloc frm;

  AddPerson(this.person,this.events,this.frm) : assert(person!=null, events!=null);

  @override
  List<Object> get props => [person,events];
}

class AddGroup extends AddingEvent {
  final String name;
  final FormBloc frm;

  AddGroup(this.name,this.frm) : assert(name!=null);

  @override
  List<Object> get props => [name];
}


class AddingState extends Equatable {
  AddingState();

  @override
  List<Object> get props => [];
}

class InitialState extends AddingState {

}

class SuccessState extends AddingState {

}

class ErrorState extends AddingState {

}

class AddDataInteractor extends Bloc<AddingEvent, AddingState> {
  final MainHomeBloc homeBloc;
  final EventPersonsRepository repo;
  AddDataInteractor(this.homeBloc,this.repo) : super(InitialState());
  List<PersonEntity> personCache;


  getGroupsList() async {
    return await repo.getAllGroups();
  }

  Future<List<PersonEntity>> getPersonList(String query) async {
    if (personCache==null) personCache=await repo.getAllPersons();
    List<PersonEntity> tmp;
    tmp=personCache.where((element) => element.name.toLowerCase().contains(query.toLowerCase())).toList();

    tmp.add(new PersonEntity(id:-1,name: S.current.com_Add("").trim()));

    return tmp;
  }

  @override
  Stream<AddingState> mapEventToState(AddingEvent event) async* {
    if (event is AddGroup) {
      try {
        int addedGroupId = await repo.addGroup(GroupEntity(id:-1,name: event.name));
        event.frm.emitSuccess(canSubmitAgain: true);
      } catch (e) {
        event.frm.emitFailure();
      }
    }
    else if (event is AddPerson) {
      try {
        int addedPersonId = await repo.addPerson(event.person);

        if (event.events != null && event.events.length > 0) {
          for (int i = 0; i < event.events.length; i++) {
            await repo.addEvent(new EventEntity(id: -1,
                date: event.events[i].date,
                name: event.events[i].name,
                eventType: event.events[i].eventType,
                personId: addedPersonId));
            //homeBloc.peopleBloc.add(HomeListEventAdded());
          }
        }

        List<PersonEntity> lst = [event.person];
        homeBloc.add(ItemAddedOrChanged(lst, event.events));
        //yield(SuccessState());
        event.frm.emitSuccess(canSubmitAgain: true);
      } catch (e) {
        event.frm.emitFailure();
      }
    } else if (event is AddEvent) {
      if (event.events!=null && event.events.length>0) {
        for (int i=0; i<event.events.length;i++) {
          await repo.addEvent(event.events[i]);
        }
      }
    }
  }
}