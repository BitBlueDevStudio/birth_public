class GroupDataDTO {
  int id;
  String name="";

  GroupDataDTO({
    this.id,
    this.name,
  });

  factory GroupDataDTO.fromMap(Map<String, dynamic> json) => GroupDataDTO(
      id: json["id"],
      name: json["name"]
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name
  };

}