import 'package:flutter/material.dart';
import 'package:test_app/app/tab/app.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(
          // fontFamily: "Cera Pro",
          // primaryColor: Color(0xFFE85852),
          // primaryColorDark: Colors.orange[400],
          ),
      home: App(),
    );
  }
}
