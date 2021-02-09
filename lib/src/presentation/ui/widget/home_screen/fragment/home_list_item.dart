import 'package:birth_days_app/src/presentation/dto/home_list/home_list_dto.dart';
import 'package:birth_days_app/src/presentation/dto/home_list/list_item_data_object.dart';
import 'package:flutter/material.dart';

class HomeListItem extends StatelessWidget {
  final DismissDirectionCallback onDismissed;
  //final GestureTapCallback onTap;
  //final ValueChanged<bool> onCheckboxChanged;
  final ListItemDataObject item;

  HomeListItem({
    @required this.item,
    @required this.onDismissed
  });


  _getItemBody(ListItemDataObject item) {
    if (item is ListDataEvent) {
      return Dismissible(
        direction: DismissDirection.endToStart,
        background: Container(
          alignment: AlignmentDirectional.centerEnd,
          color: Colors.red,
          child: Padding(
            padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
            child: Icon(Icons.delete,
              color: Colors.white,
            ),
          ),
        ),
        key: Key(item.id.toString()),
        onDismissed: onDismissed,
        child:Column(children: [ListTile(
        contentPadding: EdgeInsets.all(15),
          tileColor: Colors.transparent,
          //selectedTileColor: Colors.indigo,
          onTap: () => {},
          leading: MaterialButton(
            onPressed: () {},
            color: Colors.blue,
            textColor: Colors.white,
            child: Icon(
              Icons.cake_rounded,
              size: 24,
            ),
            padding: EdgeInsets.all(14),
            shape: CircleBorder(),
          ),
          title: Text(item.man.name),
          subtitle: Column(
              children: [
                Row(children: [
                  Text(item.name,
                      style: TextStyle(fontStyle: FontStyle.italic))
                ]),
                //TODO обработка даты
                Row(children: [
                  Text(item.dateText),
                  Padding(padding: EdgeInsets.only(left: 3))
                ])

              ]
          ),
          trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("322 дн."), Text("35 лет")])
      ),
      /*if (_getItemType(item.date)) Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.only(bottom: 10, top: 5),
                child: _getEventActions(item.date))
          ]
      )*/
      ]));
    }
    else if (item is ListDataPerson) {
      //ListDataPerson item;
      return Dismissible(
        direction: DismissDirection.endToStart,
        background: Container(
          alignment: AlignmentDirectional.centerEnd,
          color: Colors.red,
          child: Padding(
            padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
            child: Icon(Icons.delete,
              color: Colors.white,
            ),
          ),
        ),
        /*background: Container(
        alignment: AlignmentDirectional.centerStart,
        color: Colors.green,
        child: Padding(
          padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
          child: Icon(Icons.access_alarm,
            color: Colors.white,
          ),
        ),
      ),*/
        key: Key(item.id.toString()),
        onDismissed: onDismissed,
        child: ListTile(
            contentPadding: EdgeInsets.all(5),
            tileColor: Colors.white,
            //selectedTileColor: Colors.indigo,
            onTap: () => {},
            leading: Container(
                padding: EdgeInsets.all(10),
                color: Colors.red,
                child:Text(item.birthText)
            ),
            title: Text(item.name),
            subtitle: Text(item.group.name),
            trailing: Text(item.sign)
        ),
      );
    }
    else if (item is ListDataEventTitle) {
      return Column(children: [
        Padding(padding: EdgeInsets.only(top:10,bottom: 10),child: Text(item.title,style: TextStyle(fontWeight: FontWeight.bold),),),
        const Divider(
        color: Colors.black,
        height: 1,
        thickness: 1,
        indent: 15,
        endIndent: 15,
      ),
      Padding(padding: EdgeInsets.only(top:10))
      ]);
    }
    else return Text("11");
  }

  @override
  Widget build(BuildContext context) {
    return _getItemBody(item);
  }
}