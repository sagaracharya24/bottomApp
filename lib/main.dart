import 'package:bottom_app/config/custom_router.dart';
import 'package:bottom_app/config/route_paths.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Bottom Nav Example',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: CustomRouter.onGenerateRoute,
      initialRoute: RoutePaths.Splash,
    );
  }
}
