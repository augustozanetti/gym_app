import 'package:flutter/material.dart';
import 'package:gym_app/models/muscle.dart';
import 'package:gym_app/services/api.dart';
import 'package:gym_app/screens/widgets/muscle.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  static const routeName = '/';

  @override
  _HomePageState createState() => _HomePageState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _HomePageState extends State<HomePage> {
  Future<List<ResultMuscle>> _muscle = ApiService.fetchMuscle();

  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(color: Colors.black),
      child: DefaultTextStyle(
        style: Theme.of(context).textTheme.headline2,
        textAlign: TextAlign.center,
        child: FutureBuilder<List<ResultMuscle>>(
          future: _muscle,
          builder: (BuildContext context,
              AsyncSnapshot<List<ResultMuscle>> snapshot) {
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
                  ? MuscleGridView(
                      data: snapshot.data,
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
      ),
    ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
