import 'event_types.dart';

class EventEntity {
  int id;
  String name="";
  //Icon icon;
  DateTime date;
  int personId;
  EventTypes eventType;
  //List<int> additionalPersonIds;

  EventEntity ({
    this.id,
    this.name,
    this.date,
    this.eventType,
    this.personId
  });
}