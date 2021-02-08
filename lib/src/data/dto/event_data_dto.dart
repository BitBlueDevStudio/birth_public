class EventDataDTO {
  int id;
  String name="";
  //Icon icon;
  DateTime date;
  int personId;
  int eventType;
  //List<int> additionalPersonIds;

  EventDataDTO ({
    this.id,
    this.name,
    this.date,
    this.eventType,
    this.personId
  });

  factory EventDataDTO.fromMap(Map<String, dynamic> json) {
    return EventDataDTO(
      id: json["id"],
      name: json["name"],
      date: DateTime.fromMillisecondsSinceEpoch(json["date"]),
      eventType: json["type"],
      personId: json["person_id"],
    );
  }

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "date": date,
    "event_type": eventType,
    "person_id": personId,
  };

}