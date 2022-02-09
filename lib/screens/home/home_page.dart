import 'package:bottom_app/enums/bottom_nav_item.dart';
import 'package:bottom_app/widgets/tab_navigator.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BottomNavItem selectedItem = BottomNavItem.one;

  final Map<BottomNavItem, GlobalKey<NavigatorState>> navigatorKeys = {
    BottomNavItem.one: GlobalKey<NavigatorState>(),
    BottomNavItem.two: GlobalKey<NavigatorState>(),
    BottomNavItem.three: GlobalKey<NavigatorState>(),
  };

  final Map<BottomNavItem, IconData> items = const {
    BottomNavItem.one: Icons.home,
    BottomNavItem.two: Icons.add,
    BottomNavItem.three: Icons.account_circle,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          navigatorKeys[selectedItem]
              ?.currentState
              ?.popUntil((route) => route.isFirst);

          return false;
        },
        child: Stack(
          children: items
              .map(
                (item, _) => MapEntry(
                  item,
                  _buildOffstageNavigator(item, item == selectedItem),
                ),
              )
              .values
              .toList(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        currentIndex: BottomNavItem.values.indexOf(selectedItem),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {
          final currentSelectedItem = BottomNavItem.values[index];
          if (selectedItem == currentSelectedItem) {
            navigatorKeys[selectedItem]
                ?.currentState
                ?.popUntil((route) => route.isFirst);
          }
          setState(() {
            selectedItem = currentSelectedItem;
          });
        },
        items: items
            .map((item, icon) => MapEntry(
                item.toString(),
                BottomNavigationBarItem(
                    label: '',
                    icon: Icon(
                      icon,
                      size: 30.0,
                    ))))
            .values
            .toList(),
      ),
    );
  }

  Widget _buildOffstageNavigator(BottomNavItem currentItem, bool isSelected) {
    return Offstage(
      offstage: !isSelected,
      child: TabNavigator(
        navigatorKey: navigatorKeys[currentItem]!,
        item: currentItem,
      ),
    );
  }
}
