import 'package:birth_days_app/src/domain/enties/entities.dart';

import 'list_data_person.dart';
import 'list_item_data_object.dart';

class ListDataEvent implements ListItemDataObject {
  int id;
  String name="";
  //String sign="";
  //Icon icon;
  DateTime date;
  String dateText;

  EventTypes eventType;

  ListDataPersonBase man;
  //List<PersonUI> additionalPersonIds;

  ListDataEvent({
    this.id,
    this.name,
    this.date,
    this.dateText,
    this.eventType,
    this.man,
  });

}