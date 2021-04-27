import 'package:flutter/material.dart';

import 'Views/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:
          ThemeData(brightness: Brightness.dark, primaryColor: Colors.blueGrey),
      title: 'Flutter API with BLOC',
      home: MyHomePage(title: "APIBLOC"),
    );
  }
}
