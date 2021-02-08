import 'package:birth_days_app/src/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeCalendarWidget extends StatelessWidget {

  final Bloc calendarBloc;
  final String title;

  HomeCalendarWidget(this.calendarBloc,this.title);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCalendarBloc, HomeCalendarState>(
        cubit: calendarBloc,
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(title: Text(title)),
              body: _getBody(state)
          );
        });
  }
}

_getBody(dynamic state) {
  return Center(
      child:Text("Calendar")
  );
}

