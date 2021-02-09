import 'package:birth_days_app/src/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../loading_widget.dart';
import 'home_list_item.dart';

class HomeListWidget extends StatelessWidget {

  final Bloc homeListBloc;
  final ScrollController scroll;
  final String title;
  HomeListWidget(
      this.homeListBloc,this.scroll, this.title
      );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeListBloc, HomeListState>(
        cubit: homeListBloc,
        builder: (context, state) {
          return Scaffold(
              appBar: _getAppBar(title),
              body:_getBody(state,scroll)
          );
    });
  }

  Widget _getBody(dynamic state, ScrollController scroll) {
  
    if (state is HomeListStateLoading ) return LoadingIndicator();
    else if (state is HomeListStateLoaded) {
      return ListView.builder(
        padding: EdgeInsets.only(bottom: 34),
        key: Key("homeList"),
        controller: scroll,
        itemCount: state.listItems.length,
        itemBuilder: (context, index) {
          return HomeListItem(
              item: state.listItems[index],
              onDismissed: (direction) {
                if (direction==DismissDirection.endToStart) homeListBloc.add(HomeListItemDeleted(state.listItems[index].id,BlocProvider.of<MainHomeBloc>(context)));
                else {
                  homeListBloc.add(HomeListEventLoad());
                }
              }
          );
        },
      );
    }
    else if (state is HomeListStateEmpty) return Center(child:Text("Empty"));
    else return Center(child:Text("Error"));
  }
  
  Widget _getAppBar(String title) {
    return AppBar(
      title: Text(title),
      //elevation: 10,
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.search,
            semanticLabel: 'search',
          ),
          onPressed: () {
  
          },
        ),
        IconButton(
          icon: Icon(
            Icons.tune,
            semanticLabel: 'filter',
          ),
          onPressed: () {
  
          },
        ),
      ],
    );
  }
}