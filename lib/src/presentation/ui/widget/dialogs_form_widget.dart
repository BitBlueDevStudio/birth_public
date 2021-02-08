import 'package:birth_days_app/src/domain/interactors/form_add_interactor.dart';
import 'package:birth_days_app/src/presentation/bloc/form/form_add_bloc.dart';
import 'package:birth_days_app/src/presentation/dto/add_event.dart';
import 'package:birth_days_app/src/utils/ex_formlib_bloc/cupertino_datepicker.dart';
import 'package:birth_days_app/src/utils/locale_helper/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

Future<dynamic> showAddMoreEventDialog(String addlabel,FormAdEvent result, dynamic context, AddPersonAddEventFormBloc formBloc, VoidCallback onSubmit(dynamic context, dynamic state, DateTime dt, String name)) {
  return showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        height: 300,
        color: Color.fromARGB(255, 255, 255, 255),
        child: Material(child:Column(
          children: [
            Container(
                height: 300,
                child:
                BlocProvider(  create: (_) => AddPersonAddEventFormBloc(),
                    child: Builder(
                        builder: (context) {
                          formBloc = BlocProvider.of<AddPersonAddEventFormBloc>(context);
                          return FormBlocListener<AddPersonAddEventFormBloc, String, String>(
                              onSubmitting: (context, state) {

                              },
                              onSubmissionCancelled: (context, state) {

                              },
                              onSuccess: (context, state) {
                                onSubmit(context,state,formBloc.fieldDate.state.value,formBloc.textName.state.value);
                                Navigator.pop(context);
                              },
                              onFailure: (context, state) {
                                Navigator.pop(context);
                              },
                              onLoaded: (context, state) {
                                if (result.date!=null) {
                                  formBloc.textName.updateInitialValue(
                                      result.name);
                                  formBloc.fieldDate.updateInitialValue(
                                      result.date);
                                }
                              },
                              onSubmissionFailed: (context, state) {

                              },
                              child: SingleChildScrollView(
                                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                child: Column(
                                  //crossAxisAlignment: CrossAxisAlignment.s,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    TextFieldBlocBuilder(
                                      textFieldBloc: formBloc.textName,
                                      decoration: InputDecoration(
                                        labelText: S.of(context).form_AddEvent_fTitle,
                                        prefixIcon: Icon(Icons.text_fields),
                                      ),
                                    ),
                                    CupertinoDateTimeFieldBlocBuilder(
                                      dateTimeFieldBloc: formBloc.fieldDate,
                                      format: DateFormat('dd.MM.yyyy'),
                                      initialDate: result.date!=null ? result.date:DateTime.now(),
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime(2100),
                                      decoration: InputDecoration(
                                        labelText: S.of(context).form_AddEvent_fDate,
                                        prefixIcon: Icon(Icons.calendar_today_rounded),
                                        //helperText: 'Date',
                                      ),
                                    ),
                                    Padding(padding: EdgeInsets.only(top:20)),
                                    Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          RaisedButton.icon(
                                            padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                                            color:Colors.white,
                                            icon:Icon(Icons.arrow_back_ios_rounded),
                                            label: Text(S.of(context).com_Back),
                                            onPressed: (){
                                              Navigator.of(context).pop();
                                              //return _chosen;
                                            },
                                          ),
                                          Padding(padding: EdgeInsets.only(left:10)),
                                          RaisedButton.icon(
                                            padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                                            icon:Icon(Icons.check,color:Colors.white),
                                            color: Colors.lightBlue,
                                            label:  Text(addlabel,style: TextStyle(color: Colors.white)),
                                            onPressed: (){
                                              formBloc.submit();
                                              //return _chosen;
                                            },
                                          )]
                                    )
                                  ],
                                ),
                              )

                          );
                        })
                )
            ),

            // Close the modal
          ],
        )),
      ));
}

Future<dynamic> showAddGroupDialog(String addlabel, dynamic context,  VoidCallback onAdded, AddDataInteractor adb) {
  return showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        height: 300,
        color: Color.fromARGB(255, 255, 255, 255),
        child: Material(child:Column(
          children: [
            Container(
                height: 300,
                child:
                BlocProvider(  create: (_) => AddGroupFormBloc(adb),
                    child: Builder(
                        builder: (context) {
                          var formBloc = BlocProvider.of<AddGroupFormBloc>(context);
                          return FormBlocListener<AddGroupFormBloc, String, String>(
                              onSubmitting: (context, state) {

                              },
                              onSubmissionCancelled: (context, state) {

                              },
                              onSuccess: (context, state) {
                                onAdded();
                                Navigator.pop(context);
                              },
                              onFailure: (context, state) {
                                Navigator.pop(context);
                              },
                              onLoaded: (context, state) {

                              },
                              onSubmissionFailed: (context, state) {

                              },
                              child: SingleChildScrollView(
                                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                child: Column(
                                  //crossAxisAlignment: CrossAxisAlignment.s,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    TextFieldBlocBuilder(
                                      textFieldBloc: formBloc.textName,
                                      decoration: InputDecoration(
                                        labelText: S.of(context).form_AddGroupName,
                                        prefixIcon: Icon(Icons.text_fields),
                                      ),
                                    ),
                                    Padding(padding: EdgeInsets.only(top:20)),
                                    Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          RaisedButton.icon(
                                            padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                                            color:Colors.white,
                                            icon:Icon(Icons.arrow_back_ios_rounded),
                                            label: Text(S.of(context).com_Back),
                                            onPressed: (){
                                              Navigator.of(context).pop();
                                              //return _chosen;
                                            },
                                          ),
                                          Padding(padding: EdgeInsets.only(left:10)),
                                          RaisedButton.icon(
                                            padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                                            icon:Icon(Icons.check,color:Colors.white),
                                            color: Colors.lightBlue,
                                            label:  Text(addlabel,style: TextStyle(color: Colors.white)),
                                            onPressed: (){
                                              formBloc.submit();
                                              //return _chosen;
                                            },
                                          )]
                                    )
                                  ],
                                ),
                              )

                          );
                        })
                )
            ),

            // Close the modal
          ],
        )),
      ));
}
