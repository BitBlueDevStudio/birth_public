
class PersonDataDTO {

  int id;
  String name="";
  String lastName="";
  int groupId;

  PersonDataDTO({
    this.id,
    this.name,
    this.groupId,
  });

  factory PersonDataDTO.fromMap(Map<String, dynamic> json) {
    return PersonDataDTO(
      id: json["id"],
      name: json["name"],
      groupId: json["group_id"],
    );
  }

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "group_id": groupId,
  };
}