import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class FormBloc extends Cubit<FormBlocState>{
  FormBloc(FormBlocState state) : super(state);

}


class FormBlocState extends Equatable {

  FormBlocState();

  @override
  List<Object> get props => [];

}

class FormInitState extends FormBlocState {

}

class FormLoadingState extends FormBlocState {

}

class FormLoadedState extends FormBlocState {

}

class FormErrorState extends FormBlocState {

  final String error;

  FormErrorState(this.error);

  @override
  List<Object> get props => [];
}



class AddPersonFormBloc extends FormBloc {

  AddPersonFormBloc() : super(FormInitState());

  final TextFormBloc field1=TextFormBloc();

  void loadForm() async {

    try {
      emit(FormLoadedState());
    } catch (e) {
      emit(FormErrorState(e.toString()));
    }
  }

  refreshForm(String text) {

  }


}

class TextFormBloc extends FormBloc {

  String _text;

  TextFormBloc() : super(FormLoadedState());

  loadForm() async {
    emit(FormLoadedState());
  }

  updatedText(String text) {
    this._text=text;
  }

  String get textValue => _text;

  dispose() {
  }

}


