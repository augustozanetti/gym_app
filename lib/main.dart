import 'package:flutter/material.dart';
import 'package:gym_app/screens/home_page/home_page.dart';
import 'screens/home_page/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      darkTheme: ThemeData(brightness: Brightness.dark),
    );
  }
}
