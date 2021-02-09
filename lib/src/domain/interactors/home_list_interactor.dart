import 'package:birth_days_app/src/data/person_event_repository.dart';
import 'package:birth_days_app/src/domain/enties/entities.dart';


class HomeListInteractor {

  EventPersonsRepository repo;

  HomeListInteractor(this.repo);

  Future<List<CompletedEvent>> getEvents() async  {
    List<EventEntity> listEvent= await repo.getAllEvents();
    List<GroupEntity> listGroups = await repo.getAllGroups();

    List<CompletedEvent> lst=[];

    for (int i=0;i<listEvent.length;i++) {
      var evRaw=listEvent[i];
      //TODO Тут запрос к БД на поиск по ID
      PersonEntity person = await repo.getPersonById(evRaw.personId);
      GroupEntity group = listGroups.firstWhere((element) => element.id==person.groupId, orElse: () => null);

      if (person==null) continue;

      lst.add(CompletedEvent(evRaw, person, group));
    }

    return lst;

  }

  Future<List<CompletedPerson>> getPersons() async  {
    List<PersonEntity> listPerson = await repo.getAllPersons();
    List<GroupEntity> listGroups = await repo.getAllGroups();

    List<CompletedPerson> lst=[];

    for (int i=0;i<listPerson.length;i++) {
      var person=listPerson[i];
      GroupEntity group = listGroups.firstWhere((element) => element.id==person.groupId, orElse: () => null);
      EventEntity evBirth;

      List<EventEntity> listEvent = await repo.getEventsByPersonId(person.id);
      if (listEvent!=null) {
        evBirth = listEvent.firstWhere((element) => element.eventType == EventTypes.birth, orElse: () => null);
        listEvent = listEvent.where((element) => element.eventType != EventTypes.birth).toList();
      }

      lst.add(CompletedPerson(listEvent, person, group,evBirth));
    }

    return lst;

  }

  Future<int> deleteEvent(int id) async {
    return await repo.deleteEvent(id);
  }

  Future<int> deletePerson(int id) async {
    return await repo.deletePerson(id);
  }

}