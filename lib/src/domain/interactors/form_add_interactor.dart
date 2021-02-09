import 'package:birth_days_app/src/data/person_event_repository.dart';
import 'package:birth_days_app/src/domain/enties/entities.dart';
import 'package:birth_days_app/src/presentation/bloc/home_bloc.dart';
import 'package:birth_days_app/src/utils/locale_helper/l10n.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class AddDataInteractor {
  final MainHomeBloc homeBloc;
  final EventPersonsRepository repo;
  AddDataInteractor(this.homeBloc,this.repo);

  //TODO переместить кеширование в репозиторий
  List<PersonEntity> personCache;

  getGroupsList() async {
    return await repo.getAllGroups();
  }

  Future<List<PersonEntity>> getPersonList(String query) async {
    if (personCache==null) personCache=await repo.getAllPersons();
    List<PersonEntity> tmp;
    tmp=personCache.where((element) => element.name.toLowerCase().contains(query.toLowerCase())).toList();

    tmp.add(new PersonEntity(id:-1,name: S.current.com_Add("").trim()));

    return tmp;
  }

  void addGroup(GroupEntity group, FormBloc frm) async {
    try {
      int addedGroupId = await repo.addGroup(group);
      frm.emitSuccess(canSubmitAgain: true);
    } catch (e) {
    frm.emitFailure();
    }
  }

  void addPerson(PersonEntity person,List<EventEntity> events, FormBloc frm) async {
    try {
      int addedPersonId = await repo.addPerson(person);

      if (events != null && events.length > 0) {
        for (int i = 0; i < events.length; i++) {
          EventEntity evTmp=events[i];
          evTmp.personId=addedPersonId;
          await repo.addEvent(evTmp);
        }
      }

      List<PersonEntity> lst = [person];
      personCache=null;
      homeBloc.add(ItemAddedOrChanged(lst, events));

      frm.emitSuccess(canSubmitAgain: true);
    } catch (e) {
      frm.emitFailure();
    }
  }

  void addEvents(List<EventEntity> events, FormBloc frm) async {
    try {
      if (events!=null && events.length>0) {
        for (int i=0; i<events.length;i++) {
          await repo.addEvent(events[i]);
        }
      }
      frm.emitSuccess(canSubmitAgain: true);
    } catch (e) {
      frm.emitFailure();
    }
  }
}