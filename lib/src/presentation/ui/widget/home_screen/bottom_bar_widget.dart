import 'package:birth_days_app/custom_assets/bottom_icons.dart';
import 'package:birth_days_app/src/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';

class VwBottomAppBarItem {
  VwBottomAppBarItem({this.iconData});
  IconData iconData;
  //String text;
}

class VwBottomAppBar extends StatelessWidget {
  final HomeTabState activeTab;
  final Function(HomeTabState) onTabSelected;
  final Function() onMenuClicked;

  VwBottomAppBar({
    this.items,
    this.centerItemText,
    this.notchMargin,
    this.backgroundColor,
    this.color,
    this.selectedColor,
    this.notchedShape,
    @required this.activeTab,
    @required this.onTabSelected,
    @required this.onMenuClicked
  }) {
    assert(this.items.length == 2 || this.items.length == 4);
  }
  final List<VwBottomAppBarItem> items;
  final String centerItemText;
  final Color backgroundColor;
  final Color color;
  final double notchMargin;
  final Color selectedColor;
  final NotchedShape notchedShape;

  Widget _buildMiddleTabItem() {
    return Expanded(
      child: SizedBox(
      ),
    );
  }

  Widget _buildTabItem({
    VwBottomAppBarItem item,
    int index,
    ValueChanged<int> onPressed,
  }) {
    Color color = activeTab.index == index ? this.selectedColor : this.color;
    return Expanded(child: IconButton(
        //tooltip: "sa",
        splashColor: Colors.black26,
        //enableFeedback: true,
        //highlightColor: Colors.black12,
        splashRadius: 43,
        icon: Icon(item.iconData, color: color),
        onPressed:  () => onPressed(index)
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(this.items.length, (int index) {
      return _buildTabItem(
        item: this.items[index],
        index: index,
        onPressed: (index) {
          if (index==3) {
            onMenuClicked();
            //onTabSelected(AppTab.home);
          }
          else {
            onTabSelected(HomeTabState.values[index]);
          }
        },
      );
    });
    items.insert(items.length >> 1, _buildMiddleTabItem());

    return BottomAppBar(
      shape: this.notchedShape,
      notchMargin: this.notchMargin,
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: items,
          ),

        ),
        color: this.backgroundColor
    );
  }
}

Widget setupNavBar(HomeTabState activeTab, dynamic context, Function funcUpdateNav, Function funcClickMenu) {
  //var navLabels = ['Home','Calendar','People','Menu'];
  var navIcons = [BottomIcons.home,BottomIcons.calendar,Icons.people_alt_sharp,BottomIcons.menu];

  return VwBottomAppBar(
    activeTab: activeTab,
    centerItemText: '',
    color: Colors.grey,
    selectedColor: Colors.red,
    notchMargin: 6.0,
    notchedShape: CircularNotchedRectangle(),
    items: HomeTabState.values.map((tab) {
      return VwBottomAppBarItem(iconData: navIcons[tab.index]);
    }).toList(),
    onTabSelected: (tab) => funcUpdateNav(context,tab),
    /*onTabSelected: (tab) => () {
      funcUpdateNavBar(context,tab);
      },*/
    onMenuClicked: () {
      funcClickMenu(context);
      },
  );
}

Widget setupFloatingButton(dynamic context, Function funcFloatingButtonClick,int tabState) {

  var icon=Icons.person_add_alt_1_sharp; //Icons.post_add_sharp;
  //if (tabState==1) icon=Icons.add_alarm;
  //else icon=Icons.person_add_alt_1_sharp;

  //if (tabState!=1)
    return FloatingActionButton(
      //mini: true,
      //isExtended: true,
      elevation: 3,
      highlightElevation: 4,
      onPressed: ()  {
       funcFloatingButtonClick(context,tabState);
      },
      hoverColor: Colors.transparent,
      //highlightElevation: 0,
      focusColor: Colors.transparent,
      backgroundColor: Colors.red,
      child: Icon(icon)
  );
  //else return null;
}