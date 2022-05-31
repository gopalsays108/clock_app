import 'package:clock_app/enum.dart';
import 'package:clock_app/menu_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<MenuInfo>(
        child: HomePage(),
        create: (context) => MenuInfo(MenuType.clock),
      ),
    );
  }
}
