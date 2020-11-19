import 'package:flutter/material.dart';
import 'package:gym_app/screens/widgets/video.dart';

class ExecutionArguments {
  final String muscle;
  final String videoPath;

  ExecutionArguments(this.muscle, this.videoPath);
}

class ExecutionPage extends StatelessWidget {
  static const routeName = "/execution";

  @override
  Widget build(BuildContext context) {
    final ExecutionArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(args.muscle),
      ),
      body: VideoPlayerScreen(path: args.videoPath),
    );
  }
}
