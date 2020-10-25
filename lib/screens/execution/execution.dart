import 'package:flutter/material.dart';

class ExecutionPage extends StatelessWidget {
  static const routeName = "/execution";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("test"),
      ),
      body: Container(alignment: Alignment.center, child: Icon(Icons.alarm)),
    );
  }
}
