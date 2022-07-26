import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:payfazz_learn/modules/home/home_module.dart';
import 'package:payfazz_learn/modules/home/pages/home_page.dart';

void main() async {
  runApp(
    ModularApp(module: HomeModule()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Modular.navigatorKey,
      onGenerateRoute: Modular.generateRoute,
      initialRoute: "/",
    );
  }
}
