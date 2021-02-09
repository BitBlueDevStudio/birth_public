import 'package:birth_days_app/src/data/person_event_repository.dart';
import 'package:birth_days_app/src/domain/interactors/home_list_interactor.dart';
import 'package:birth_days_app/src/presentation/bloc/home_bloc.dart';
import 'package:birth_days_app/src/presentation/ui/widget/home_screen/form_add_widget.dart';
import 'package:birth_days_app/src/utils/locale_helper/l10n.dart';

import '../widget/home_screen/bottom_bar_widget.dart';
import '../widget/home_screen/fragment/home_calendar_widget.dart';
import '../widget/home_screen/fragment/home_list_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  _getBodyWidget(int index, dynamic context) {

    if (index==0) {
      ScrollController _controller;
      _controller = ScrollController(initialScrollOffset:  BlocProvider.of<MainHomeBloc>(context).scrolled,keepScrollOffset: true)..addListener(() {
        BlocProvider.of<MainHomeBloc>(context).scrolled=_controller.position.pixels;
      });
      return HomeListWidget(BlocProvider.of<MainHomeBloc>(context).eventsBloc, _controller,S.of(context).frag1Title);
    }
    else if (index==1) {
      return HomeCalendarWidget(BlocProvider.of<MainHomeBloc>(context).calendarBloc,S.of(context).frag2Title);
    }
    else if (index==2) {
      ScrollController _controller2;
      _controller2 = ScrollController(initialScrollOffset:  BlocProvider.of<MainHomeBloc>(context).scrolled2,keepScrollOffset: true)..addListener(() {
        BlocProvider.of<MainHomeBloc>(context).scrolled2=_controller2.position.pixels;
      });
      return HomeListWidget(BlocProvider.of<MainHomeBloc>(context).peopleBloc, _controller2,S.of(context).frag3Title);
    }
  }

  void funcUpdateNavBar(dynamic context,HomeTabState tab) {
    BlocProvider.of<MainHomeBloc>(context).add(NavUpdated(tab));
  }

  void funcFloatingButtonClick(dynamic context,int index) {
    getAddingPersonBottomSheet(context);
   /* if (index==1) {
      _getAddingEventBottomSheet(context);
      //BlocProvider.of<MainHomeBloc>(context).eventsBloc.add(HomeListEventAdded());
    } else {
      _getAddingPersonBottomSheet(context);
    }*/

    }

  void funcClickMenu(dynamic context) {
    Navigator.pushNamed(context, '/menu');
  }



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => MainHomeBloc(HomeListBloc(HomeListInteractor(EventPersonsRepository()),false)..add(HomeListEventLoad())
            ,HomeCalendarBloc(),
            HomeListBloc(HomeListInteractor(EventPersonsRepository()),true)..add(HomeListEventLoad())
        ),
        child: BlocBuilder<MainHomeBloc, HomeTabState>(
            builder: (context, tabState) {
              return Scaffold(
                  key: _scaffoldKey,
                  //appBar: AppBar(title: Text('Birth Days')),
                  body: _getBodyWidget(tabState.index, context),

                  bottomNavigationBar: setupNavBar(tabState,context,funcUpdateNavBar,(dynamic context) => Navigator.pushNamed(context, '/menu')),
                  floatingActionButton: setupFloatingButton(context,funcFloatingButtonClick, tabState.index),
                  floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked

              );
            }));
  }
}