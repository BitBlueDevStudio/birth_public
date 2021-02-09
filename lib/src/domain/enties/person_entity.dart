import 'package:birth_days_app/src/domain/interactors/interactor_helpers.dart';
import 'package:birth_days_app/src/utils/locale_helper/l10n.dart';

class PersonEntity {

  int id;
  String name="";
  //String avatar="";
  int groupId;

  PersonEntity({
    this.id,
    this.name,
    this.groupId,
  });

}