import 'package:flutter/material.dart';
import 'package:gym_app/models/muscleGroup.dart';
import 'package:gym_app/screens/execution/execution.dart';
import 'package:gym_app/services/api.dart';

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
    Future<List<ResultMuscleGroup>> _muscleGroup =
        ApiService.fetchMuscleGroup(args.title);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: FutureBuilder<List<ResultMuscleGroup>>(
        future: _muscleGroup,
        builder: (BuildContext context,
            AsyncSnapshot<List<ResultMuscleGroup>> snapshot) {
          List<Widget> children;
          if (snapshot.hasError) {
            children = <Widget>[
              Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              )
            ];
          } else {
            children = <Widget>[
              Center(
                child: SizedBox(
                  child: CircularProgressIndicator(),
                  width: 60,
                  height: 60,
                ),
              )
            ];
          }
          return Center(
            child: snapshot.hasData
                ? ListView.builder(
                    padding: const EdgeInsets.all(5.5),
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              leading: Icon(Icons.access_alarm),
                              title: Text(snapshot.data[index].name),
                              subtitle: Text(snapshot.data[index].level),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                FlatButton(
                                  child: const Text('Iniciar'),
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, ExecutionPage.routeName,
                                        arguments: ExecutionArguments(
                                            snapshot.data[index].name,
                                            snapshot.data[index].videoPath));
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: children,
                    ),
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
