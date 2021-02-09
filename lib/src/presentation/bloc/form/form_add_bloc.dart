import 'package:birth_days_app/src/domain/enties/entities.dart';
import 'package:birth_days_app/src/domain/interactors/form_add_interactor.dart';
import 'package:birth_days_app/src/presentation/dto/add_event.dart';
import 'package:birth_days_app/src/utils/locale_helper/l10n.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';




class AddEventFormBloc extends FormBloc<String, String> {
  final AddDataInteractor addBloc;
  dynamic context;
  List<PersonEntity> lstTmp;

  final textName = TextFieldBloc<PersonEntity>();
  int selectedId;

  //final textTitle = TextFieldBloc();

  final eventFields = ListFieldBloc<InputFieldBloc<FormAdEvent, Object>>();

  AddEventFormBloc(this.addBloc,this.context) : super(isLoading: true)  {
    addFieldBlocs(fieldBlocs: [
      textName,
      //textTitle,
      eventFields,
    ]);
  }

  void removeEv(int index) {
    if (eventFields.value.length>1) eventFields.removeFieldBlocAt(index);
    else {}
  }

  @override
  void onLoading() async {
    try {


      /*textName.onValueChanges(
        onData: (previous, current) async* {
          if (current.extraData) {
            addFieldBlocs(fieldBlocs: [secretField]);
          } else {
            removeFieldBlocs(fieldBlocs: [secretField]);
          }
        },
      );*/


      //eventFields.addFieldBloc(new InputFieldBloc<FormAdEvent, Object>( initialValue: new FormAdEvent(null, S.current.form_Add_Event)));

      emitLoaded();
    } catch (e) {
      emitLoadFailed();
    }

  }

  @override
  void onSubmitting() async {
    try {

    } catch (e) {
      emitFailure();
    }
  }

  @override Future<void> close() {
    textName.close();
    eventFields.close();
    return super.close();
  }
}

class AddPersonFormBloc extends FormBloc<String, String> {
  final AddDataInteractor addBloc;
  List<GroupEntity> groupList;
  Function(AddDataInteractor adb) onNewGroup;

  final textName = TextFieldBloc();

  final select1 = SelectFieldBloc<GroupEntity,String>(
    items: [new GroupEntity(id:-1,name: S.current.com_NotSelected)],
  );
  GroupEntity selectedGroup;


  final birthDate = InputFieldBloc<DateTime, Object>();

  final eventFields = ListFieldBloc<InputFieldBloc<FormAdEvent, Object>>();


  AddPersonFormBloc(this.addBloc,this.onNewGroup) : super(isLoading: true)  {
    addFieldBlocs(fieldBlocs: [
      textName,
      select1,
      birthDate,
      eventFields,
    ]);
  }

  void removeEv(int index) {
    eventFields.removeFieldBlocAt(index);
  }

  void addedGroup() async {
    /*select1.clear();
    select1.updateItems(select1.state.items.sublist(0,select1.state.items.length-1));
    select1.addItem(new group here);
    select1.addItem(PersonGroup(id: -2, name: S.current.com_CreateNew));*/
    //TODO сделать нормальное обновление без перезагрузки из БД

    select1.updateItems(select1.state.items.sublist(0,1));
    groupList=[];
    groupList=await addBloc.getGroupsList();

    for (int i=0;i<groupList.length;i++) {
      select1.addItem(groupList[i]);
    }

    select1.addItem((GroupEntity(id: -2, name: S.current.com_CreateNew)));

    select1.updateValue(groupList[groupList.length-1]);

  }
  @override
  void onLoading() async {
    try {
      groupList=[];
      groupList=await addBloc.getGroupsList();
      //groupList.add(PersonGroup(id: -2, name: S.current.com_CreateNew));

      for (int i=0;i<groupList.length;i++) {
        select1.addItem(groupList[i]);
      }


      //await Future<void>.delayed(Duration(milliseconds: 3500));

      select1.addItem((GroupEntity(id: -2, name: S.current.com_CreateNew)));

      Stream<dynamic> selectCallback(SelectFieldBlocState<GroupEntity,String> prev,SelectFieldBlocState<GroupEntity,String> cur) {
        if (cur.value.id==-2) {
          onNewGroup(addBloc);
          select1.updateValue(prev.value);
        }

        return null;

      }

      select1.onValueChanges(onData: selectCallback);

      select1.updateInitialValue(select1.state.items[0]);

      emitLoaded();
    } catch (e) {

      emitLoadFailed();
    }

  }

  @override
  void onSubmitting() async {
    try {

      if (!(textName.value.length>0)) {
        textName.addFieldError(S.current.formError_Add_fName);
        emitSubmissionCancelled();
        return;
      }

      PersonEntity prs=PersonEntity(
          id: 0,
          name: textName.value,
          groupId: select1.value.id
      );

      List<EventEntity> evs=[];

      if (birthDate.value!=null) {
        evs.add(new EventEntity(id:-1,name:"др",date:birthDate.value,personId: -1,eventType: EventTypes.birth));
      }

      for (int i=0;i<eventFields.value.length;i++) {
        evs.add(new EventEntity(id:-1,name:eventFields.value[i].value.name,date:eventFields.value[i].value.date,personId: -1,eventType: EventTypes.anni));
      }

      addBloc.addPerson(prs, evs,this);

    } catch (e) {
      emitFailure();
    }
  }

  @override Future<void> close() {
    select1.close();
    birthDate.close();
    eventFields.close();
    return super.close();
  }

}

class AddPersonAddEventFormBloc extends FormBloc<String, String> {

  final textName = TextFieldBloc();

  final fieldDate = InputFieldBloc<DateTime, Object>();


  AddPersonAddEventFormBloc() : super(isLoading: true)  {
    addFieldBlocs(fieldBlocs: [
      textName,
      fieldDate,
    ]);
  }

  @override
  void onLoading() async {
    try {
      emitLoaded();
    } catch (e) {
      emitLoadFailed();
    }
  }

  @override
  void onSubmitting() async {
    try {

      bool iser=false;

      if (!(textName.value.length>0)) {
        textName.addFieldError(S.current.formError_AddEvent_fTitle);
        iser=true;
      }

      if (fieldDate.value==null) {
        fieldDate.addFieldError(S.current.formError_AddEvent_fDate);
        iser=true;
      }

      if (iser) {
        emitSubmissionCancelled();
      } else {
        emitSuccess();
      }

    } catch (e) {
      emitFailure();
    }
  }

  @override Future<void> close() {
    fieldDate.close();
    return super.close();
  }

}

class AddGroupFormBloc extends FormBloc<String, String> {

  final textName = TextFieldBloc();
  final AddDataInteractor addBloc;

  AddGroupFormBloc(this.addBloc) : super(isLoading: true)  {
    addFieldBlocs(fieldBlocs: [
      textName,
    ]);
  }

  @override
  void onLoading() async {
    try {
      emitLoaded();
    } catch (e) {
      emitLoadFailed();
    }
  }

  @override
  void onSubmitting() async {
    try {

      if (!(textName.value.length>0)) {
        textName.addFieldError(S.current.formError_AddEvent_fTitle);
        emitSubmissionCancelled();
        return;
      }

      addBloc.addGroup(GroupEntity(name: textName.value),this);

      //emitSuccess();

    } catch (e) {
      emitFailure();
    }
  }

  @override Future<void> close() {
    return super.close();
  }

}