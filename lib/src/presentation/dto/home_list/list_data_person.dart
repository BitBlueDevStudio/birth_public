import 'package:birth_days_app/src/domain/enties/entities.dart';
import 'list_data_event.dart';
import 'list_item_data_object.dart';

class ListDataPersonBase {
  int id;
  String name;
  int groupId;
  GroupEntity group;

  ListDataPersonBase({
    this.id,
    this.name,
    this.group
  });

}

class ListDataPerson extends ListDataPersonBase implements ListItemDataObject {
  String sign;
  String yearSign;
  DateTime birth;
  String birthText;
  int age;
  String ageText;

  List<ListDataEvent> listOtherEvents;

  ListDataPerson({
    id,
    name,
    group,
    this.age,
    this.sign,
    this.yearSign,
    this.birth,
    this.birthText
  }) : super(id:id,name:name,group: group);

}
