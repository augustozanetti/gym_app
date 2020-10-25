import 'package:flutter/material.dart';
import 'package:gym_app/screens/execution/execution.dart';

class Data {
  Map fetched_data = {
    "data": [
      {"id": "peito", "name": "Supino Reto", "level": "Iniciante"},
      {"id": "peito", "name": "Supino Inclinado", "level": "Intermediário"},
      {"id": "peito", "name": "Supino Declinado", "level": "Intermediário"},
      {"id": "abdomen", "name": "Abdomen", "level": "Iniciante"},
      {"id": "ombro", "name": "Elevação Frontal", "level": "Iniciante"},
      {"id": "ombro", "name": "Elevação Lateral", "level": "Iniciante"},
      {"id": "costas", "name": "Remada", "level": "Iniciante"},
      {"id": "costas", "name": "Puxada Aberta", "level": "Iniciante"},
      {"id": "biceps", "name": "Biceps", "level": "Iniciante"},
      {"id": "pernas", "name": "Pernas", "level": "Iniciante"}
    ]
  };
  List _data;

  Data(String id) {
    _data = fetched_data["data"]
        .where((item) => item["id"] == id.toLowerCase())
        .toList();
  }

  int getId(int index) {
    return _data[index]["id"];
  }

  String getName(int index) {
    return _data[index]["name"];
  }

  String getLevel(int index) {
    return _data[index]["level"];
  }

  int getLength() {
    return _data.length;
  }
}

class TrainingArguments {
  final String title;

  TrainingArguments(this.title);
}

class TrainingPage extends StatefulWidget {
  static const routeName = '/training';
  @override
  _TrainingPageState createState() => _TrainingPageState();
}

class _TrainingPageState extends State<TrainingPage> {
  @override
  Widget build(BuildContext context) {
    final TrainingArguments args = ModalRoute.of(context).settings.arguments;
    Data _data = new Data(args.title);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(5.5),
        itemCount: _data.getLength(),
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.access_alarm),
                  title: Text(
                    _data.getName(index),
                  ),
                  subtitle: Text(_data.getLevel(index)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FlatButton(
                      child: const Text('Iniciar'),
                      onPressed: () {
                        Navigator.pushNamed(context, ExecutionPage.routeName);
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
