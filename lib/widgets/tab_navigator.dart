import 'package:bottom_app/config/custom_router.dart';
import 'package:bottom_app/enums/bottom_nav_item.dart';
import 'package:bottom_app/screens/main/main_page.dart';
import 'package:bottom_app/screens/posts/posts.dart';
import 'package:bottom_app/screens/profile/profile.dart';
import 'package:flutter/material.dart';

class TabNavigator extends StatelessWidget {
  static const String tabNavigatorRoot = '/';

  final GlobalKey<NavigatorState> navigatorKey;
  final BottomNavItem item;

  const TabNavigator({Key? key, required this.navigatorKey, required this.item})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilder();
    return Navigator(
      key: navigatorKey,
      initialRoute: tabNavigatorRoot,
      onGenerateInitialRoutes: (_, initialRoute) {
        return [
          MaterialPageRoute(
              settings: const RouteSettings(name: tabNavigatorRoot),
              builder: (context) => routeBuilders[initialRoute]!(context))
        ];
      },
      onGenerateRoute: CustomRouter.onGenerateNestedRoute,
    );
  }

  Map<String, WidgetBuilder> _routeBuilder() {
    return {tabNavigatorRoot: (context) => _getScren(context, item)};
  }

  _getScren(BuildContext context, BottomNavItem item) {
    switch (item) {
      case BottomNavItem.one:
        return const MainPage();
      case BottomNavItem.two:
        return const Posts();
      case BottomNavItem.three:
        return const Profile();
      default:
        return const Scaffold();
    }
  }
}
