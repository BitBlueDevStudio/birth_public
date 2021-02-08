import 'package:birth_days_app/src/data/sqlite_helper.dart';
import 'package:birth_days_app/src/domain/enties/entities.dart';

import 'dto/event_data_dto.dart';
import 'dto/group_data_dto.dart';
import 'dto/person_data_dto.dart';

class EventPersonsRepository {

  DBProvider database=DBProvider.db;

  PersonEntity _personToEntity(PersonDataDTO personDTO) {
    return PersonEntity(
      id: personDTO.id,
      name: personDTO.name,
      groupId: personDTO.groupId,
    );
  }
  PersonDataDTO _personToDTO(PersonEntity person) {
    return PersonDataDTO(
      id: person.id,
      name: person.name,
      groupId: person.groupId
    );
  }

  EventEntity _eventToEntity(EventDataDTO eventDTO) {
    return EventEntity(
      id:eventDTO.id,
      name:eventDTO.name,
      date: eventDTO.date,
      personId: eventDTO.personId,
      eventType: EventTypes.values[eventDTO.eventType]
    );
  }
  EventDataDTO _eventToDTO(EventEntity event) {
    return EventDataDTO(
      id:event.id,
      name:event.name,
      date:event.date,
      eventType: event.eventType.index,
      personId: event.personId
    );
  }

  GroupEntity _groupToEntity(GroupDataDTO groupDTO) {
    return GroupEntity(
      id: groupDTO.id,
      name: groupDTO.name
    );
  }
  GroupDataDTO _groupToDTO(GroupEntity group) {
    return GroupDataDTO(
      id:group.id,
      name: group.name
    );
  }

  Future<List<PersonEntity>> getAllPersons() async {
    var persons= await database.getAllPersons();
    List<PersonEntity> lst=persons.map((c) => _personToEntity(c)).toList();
    return lst.isNotEmpty ? lst : [];
  }

  Future<PersonEntity> getPersonById(int id) async {
    var person = await database.getPersonById(id);
    return _personToEntity(person);
  }

  Future<List<PersonEntity>> getPersonsByFilter([String name]) async {
    var persons = await database.getPersonByFilter(name);
    List<PersonEntity> lst=persons.map((c) => _personToEntity(c)).toList();
    return lst.isNotEmpty ? lst : [];
  }

  Future<List<EventEntity>> getAllEvents() async {
    var events = await database.getAllEvents();
    List<EventEntity> lst=events.map((c) => _eventToEntity(c)).toList();
    return lst.isNotEmpty ? lst : [];
  }

  getEventById(int id) async {
    var event = await database.getEventById(id);
    return _eventToEntity(event);
  }

  getEventsByFilter() {}

  getEventsByPersonId(int id) async {
    var events = await database.getEventsByPersonId(id);
    List<EventEntity> lst=events.map((c) => _eventToEntity(c)).toList();
    return lst.isNotEmpty ? lst : [];
  }

  Future<List<GroupEntity>> getAllGroups() async {
    var groups = await database.getAllGroups();
    List<GroupEntity> lst=groups.map((c) => _groupToEntity(c)).toList();
    return lst.isNotEmpty ? lst : [];
  }

  addPerson(PersonEntity newPerson) async {
    return await database.addPerson(_personToDTO(newPerson));
  }

  updatePerson(PersonEntity updatedPerson) async {
    return await database.updatePerson(_personToDTO(updatedPerson));
  }

  deletePerson(id) async {
    return await database.deletePerson(id);
  }


  addEvent(EventEntity newEvent) async  {
    return await database.addEvent(_eventToDTO(newEvent));
  }

  updateEvent(EventEntity event) async {
    //return await database.updateEvent(_eventToDTO(event));
  }

  deleteEvent(int id) async {
    return await database.deletePersonEvent(id);
  }

  addGroup(GroupEntity newGroup) async  {
    return await database.addGroup(_groupToDTO(newGroup));
  }

}