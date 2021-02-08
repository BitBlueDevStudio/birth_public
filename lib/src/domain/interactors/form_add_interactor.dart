import 'package:birth_days_app/src/data/person_event_repository.dart';
import 'package:birth_days_app/src/domain/enties/entities.dart';
import 'package:birth_days_app/src/presentation/bloc/form/form_add_bloc.dart';
import 'package:birth_days_app/src/presentation/bloc/home_bloc.dart';

class FormAddInteractor {
  final EventPersonsRepository repo;
  final MainHomeBloc homeBloc;

  FormAddInteractor(this.repo,this.homeBloc);


  void addGroup(GroupEntity group, FormBloc form) async {
    try {
      int addedGroupId = await repo.addGroup(GroupEntity(name: group.name));
      //form.frm.emitSuccess(canSubmitAgain: true);
    } catch (e) {
      //form.frm.emitFailure();
    }
  }

  void addPerson(List<EventEntity> events, PersonEntity person, FormBloc form) async {
    try {
      int addedPersonId = await repo.addPerson(person);

      if (events != null && events.length > 0) {
        for (int i = 0; i < events.length; i++) {
          await repo.addEvent(new EventEntity(id: -1,
              date: events[i].date,
              name: events[i].name,
              eventType: events[i].eventType,
              personId: addedPersonId));
          //homeBloc.peopleBloc.add(HomeListEventAdded());
        }
      }

      List<PersonEntity> lst = [person];
      //homeBloc.add(ItemAddedOrChanged(lst, event.events));
      //yield(SuccessState());
      //form.frm.emitSuccess(canSubmitAgain: true);
    } catch (e) {
      //form.frm.emitFailure();
    }
  }

  void addEvents(List<EventEntity> events, FormBloc form) async
  {
    try {
      if (events != null && events.length > 0) {
        for (int i = 0; i < events.length; i++) {
          await repo.addEvent(events[i]);
        }
      } else {
        Exception("Пустой запрос");
      }
      //form.frm.emitSuccess(canSubmitAgain: true);
    } catch (e) {
      //form.frm.emitFailure();
    }
  }

}