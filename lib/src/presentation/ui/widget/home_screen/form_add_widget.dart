import 'dart:developer';

import 'package:birth_days_app/src/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:birth_days_app/src/utils/locale_helper/l10n.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:birth_days_app/src/presentation/bloc/form/form_add_bloc.dart';

import '../loading_widget.dart';


getAddingPersonBottomSheet(dynamic context, MainHomeBloc hm) {
  initializeDateFormatting(Intl.getCurrentLocale(), null);

  AddPersonFormBloc formBloc=AddPersonFormBloc();
  int ps;

  //final _formKey = GlobalKey<FormState>();

  //showNewGroupModal(AddDataBloc adb) async{
   /* onAdded() {
      formBloc.addedGroup();
    }
    await showAddGroupDialog(S.current.com_Add("").trim(),context,onAdded,adb);*/
 // }

  showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        //return BlocProvider(  create: (_) => AddDataBloc(hm,EventPersonsRepository()),
        //child:BlocBuilder<AddDataBloc, AddingState>(
        return BlocProvider(  create: (_) => formBloc,
            child: BlocBuilder<AddPersonFormBloc,FormBlocState>(
                cubit: formBloc,
                builder: (context,stateb) {
                  formBloc = BlocProvider.of<AddPersonFormBloc>(context);
                  return Stack(children:[

                        NotificationListener<DraggableScrollableNotification>(
                            onNotification: (DraggableScrollableNotification notification) {
                              return;
                              //TODO Убрать потом
                            },
                            child: DraggableScrollableSheet(
                                expand: false,
                                maxChildSize: 0.9,
                                //initialChildSize: 0.5,
                                builder: (_, controller) {
                                  if (stateb is FormLoadingState) return LoadingIndicator();
                                  else return SingleChildScrollView(
                                    controller: controller,
                                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                    child: Column(
                                      //crossAxisAlignment: CrossAxisAlignment.s,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children:
                                            [
                                              Text(S.of(context).form_Add_title,style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                                              RaisedButton.icon(
                                                  icon: Icon(Icons.import_export_rounded),
                                                  label: Text(S.of(context).com_Import),
                                                  onPressed: () {
                                                  })
                                            ]
                                        ),
                                      TextField(
                                        onChanged: (String text) {
                                          formBloc.field1.updatedText(text);
                                        },
                                        enableSuggestions: false,
                                        decoration: InputDecoration(
                                          labelText: S
                                              .of(context)
                                              .form_Add_fName,
                                          prefixIcon: Icon(
                                              Icons.person_pin_rounded),
                                        ),
                                        ), InputDatePickerFormField(

                                            initialDate: DateTime.now().subtract(Duration(days: 3650)),
                                            firstDate: DateTime(1900),
                                            lastDate: DateTime(2100),
                                            fieldLabelText: S.of(context).form_Add_Birth,
                                        )
                                  ]));
                                })),
                        Positioned(
                            bottom: 0,
                            left:0,
                            right: 0, // Padding to create some space on the right
                            child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(width: 1.0, color: Colors.black54),
                                  ),
                                  //color: Colors.black,
                                ),
                                child:Row(
                                    children:[
                                      //if (!(stateb is FormLoadingState))
                                        Expanded(
                                          child:Container(
                                              color: Colors.white,
                                              alignment: Alignment.bottomCenter,
                                              child: SizedBox(
                                                  width: double.infinity,
                                                  // height: double.infinity,
                                                  child:Material(
                                                      type: MaterialType.transparency,
                                                      child: InkWell(
                                                        child:Padding(
                                                            padding:EdgeInsets.only(top:9,bottom:9),
                                                            child:Icon(Icons.arrow_back_ios_rounded,color: Colors.black,size:22)
                                                        ),
                                                        onTap: () {
                                                          Navigator.pop(context);
                                                        },
                                                      )

                                                  )
                                              )
                                          )
                                      ),
                                      //if (!(stateb is FormLoadingState))
                                        Expanded(
                                          child:Container(
                                              color: Colors.lightBlue,
                                              alignment: Alignment.bottomCenter,
                                              child: SizedBox(
                                                  width: double.infinity,
                                                  // height: double.infinity,
                                                  child:Material(
                                                      type: MaterialType.transparency,
                                                      child: InkWell(
                                                        splashColor: Colors.white,
                                                        child:Padding(
                                                            padding:EdgeInsets.only(top:7,bottom:7),
                                                            child:Icon(Icons.check_rounded,color: Colors.white,size:26)
                                                        ),
                                                        onTap: () {
                                                          //formBloc.submit();
                                                        },
                                                      )

                                                  )
                                              )
                                          )
                                      )
                                    ]
                                )
                            )
                        ),
                      ]);
                })
        );
      }).whenComplete(() {
    //hm.close();
    formBloc.close();
  });
}

//TODO event add
/*_getAddingEventBottomSheet(dynamic context) async {
    initializeDateFormatting(Intl.getCurrentLocale(), null);

    var hm = BlocProvider.of<MainHomeBloc>(context);
    AddEventFormBloc formBloc;

    var r= await showModalBottomSheet<int>(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return BlocProvider(  create: (_) => AddEventFormBloc(AddDataBloc(hm,EventPersonsRepository()),context),
              child: Builder(
                  builder: (context) {
                    formBloc = BlocProvider.of<AddEventFormBloc>(context);
                    return FormBlocListener<AddEventFormBloc, String, String>(
                        onSubmitting: (context, state) {

                        },
                        onSubmissionCancelled: (context, state) {

                        },
                        onSuccess: (context, state) {
                          Navigator.pop(context);
                        },
                        onFailure: (context, state) {
                          log("FormError");
                          Navigator.pop(context);
                        },
                        onLoaded: (context, state) {

                        },
                        onSubmissionFailed: (context, state) {
                          log("Submission error");
                        },
                        child:DraggableScrollableSheet(
                            expand: false,
                            maxChildSize: 0.9,
                            //initialChildSize: 0.5,
                            builder: (_, controller) {
                              return SingleChildScrollView(
                                controller: controller,
                                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                child: Column(
                                  //crossAxisAlignment: CrossAxisAlignment.s,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    SugTextFieldBlocBuilder(
                                      debounceSuggestionDuration: Duration(milliseconds: 20),
                                      addBloc: formBloc.addBloc,
                                      onunSelected: () {
                                        formBloc.textName.clear();
                                      },
                                      onSubmitted: (value) async {
                                        if (value.id==-1) {
                                          Navigator.of(context).pop(-1);
                                        } else {
                                          formBloc.textName.updateExtraData(value);
                                          onSubmit(dynamic context, dynamic state, DateTime dt, String name) {
                                            formBloc.eventFields.addFieldBloc(new InputFieldBloc<FormAdEvent, Object>( initialValue: new FormAdEvent(dt, name)));
                                          }

                                          FormAdEvent result=FormAdEvent(null, "");
                                          AddPersonAddEventFormBloc formBlocz;

                                          await showAddMoreEventDialog(S.of(context).com_Add("").trim(),result, context, formBlocz, onSubmit);
                                        }
                                      },
                                      getImmediateSuggestions: true,
                                      textFieldBloc: formBloc.textName,
                                      decoration: InputDecoration(
                                        labelText: S.of(context).form_Add_Ev_fMan,
                                        prefixIcon: Icon(Icons.person_search_sharp),
                                      ),
                                    ),
                                Padding(padding: EdgeInsets.only(top:20)),
                                    /*TextFieldBlocBuilder(
                                      textFieldBloc: formBloc.textTitle,
                                      decoration: InputDecoration(
                                        labelText: S.of(context).form_AddEvent_fTitle,
                                        prefixIcon: Icon(Icons.text_fields),
                                      ),
                                    ),*/
                                    BlocBuilder<ListFieldBloc<InputFieldBloc<FormAdEvent, Object>>,
                                        ListFieldBlocState<InputFieldBloc<FormAdEvent, Object>>>(
                                      cubit: formBloc.eventFields,
                                      builder: (context, state) {
                                        if (state.fieldBlocs.isNotEmpty) {
                                          return ListView.builder(
                                            shrinkWrap: true,
                                            physics: NeverScrollableScrollPhysics(),
                                            itemCount: state.fieldBlocs.length,
                                            itemBuilder: (context, i) {
                                              final ev = state.fieldBlocs[i];
                                              return AdEventFieldBlocBuilder(
                                                dateTimeFieldBloc: ev,
                                                onRemoveMember: () {
                                                  formBloc.removeEv(i);
                                                },
                                                format: DateFormat('dd.MM.yyyy'),
                                                initialDate: ev.value.date,
                                                firstDate: DateTime(1900),
                                                lastDate: DateTime(2100),
                                                decoration: InputDecoration(
                                                  labelText: ev.value.name,
                                                  prefixIcon: Icon(Icons.calendar_today),
                                                  //helperText: 'Date',
                                                ),
                                              );

                                            },
                                          );
                                        }
                                        return Container();
                                      },
                                    ),
                                    Padding(padding: EdgeInsets.only(top:20)),
                                    RaisedButton.icon(
                                      onPressed: () async {

                                        onSubmit(dynamic context, dynamic state, DateTime dt, String name) {
                                          formBloc.eventFields.addFieldBloc(new InputFieldBloc<FormAdEvent, Object>( initialValue: new FormAdEvent(dt, name)));
                                        }

                                        FormAdEvent result=FormAdEvent(null, "");
                                        AddPersonAddEventFormBloc formBlocz;

                                        await showAddMoreEventDialog(S.of(context).com_Add("").trim(),result, context, formBlocz, onSubmit);

                                        //formBloc.eventFields.addFieldBloc(new InputFieldBloc<FormAdEvent, Object>( initialValue: new FormAdEvent(DateTime.now(), "Свадьба")));
                                      },
                                      icon: Icon(Icons.add),
                                      label: Text(S.of(context).form_Add_AddEvent),
                                    ),
                                    Align(
                                        alignment: Alignment.bottomCenter,
                                        child:
                                        RaisedButton.icon(
                                          onPressed: () => {
                                            formBloc.submit()
                                          },
                                          icon: Icon(Icons.person_add),
                                          label: Text(S.of(context).form_Add_Submit),
                                        )
                                    )
                                  ],
                                ),
                              );
                            })
                    );
                  })
          );
        }).whenComplete(() {
      //hm.close();
      formBloc.close();
    });

    if (r==-1) {
      hm.add(NavUpdated(HomeTabState.third));
      _getAddingPersonBottomSheet(context);
    }
  }*/