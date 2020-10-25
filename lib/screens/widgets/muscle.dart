import 'package:flutter/material.dart';
import 'package:gym_app/models/muscle.dart';
import 'package:gym_app/screens/training_page/training_page.dart';

class MuscleGridView extends StatelessWidget {
  final List<ResultMuscle> data;

  MuscleGridView({Key key, @required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        padding: EdgeInsets.all(20),
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        crossAxisCount: 2,
        shrinkWrap: true,
        children: data
            .map((item) => Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, TrainingPage.routeName,
                            arguments: TrainingArguments(item.name));
                      },
                      child: CircleAvatar(
                        radius: 55,
                        child: CircleAvatar(
                          radius: 55,
                          backgroundColor: Colors.transparent,
                          backgroundImage: NetworkImage(item.pathImage),
                        ),
                      ),
                    ),
                    Text(
                      item.name ?? '',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ))
            .toList());
  }
}
