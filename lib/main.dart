import 'package:flutter/material.dart';
import 'package:gym_app/screens/execution/execution.dart';
import 'package:gym_app/screens/home_page/home_page.dart';
import 'package:gym_app/screens/training_page/training_page.dart';
import 'screens/home_page/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        HomePage.routeName: (context) => HomePage(),
        TrainingPage.routeName: (context) => TrainingPage(),
        ExecutionPage.routeName: (context) => ExecutionPage(),
      },
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(brightness: Brightness.dark),
    );
  }
}
