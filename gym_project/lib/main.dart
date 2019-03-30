import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'models/exercise.dart';
import 'signin.dart';
import 'exercices_list.dart';

void main() {
  runApp(GymProject());
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarDividerColor: Colors.black,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
  );
}

class GymProject extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GymProject',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white,
        accentColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const MyHomePage(title: 'Gym Project'),
    );
  }

}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(widget.title),
        ),
        elevation: 0.0,
      ),
      floatingActionButton: const SignInFab(),
//      body: ExerciseList(_loadPosts(context)),
    );
  }

  Stream<List<Exercise>> _loadPosts(BuildContext context) {
    return DefaultAssetBundle.of(context)
        .loadString('assets/mock_exercises.json')
        .then<List<dynamic>>((String value) => json.decode(value))
        .asStream()
        .map(_convertToPosts);
  }

  List<Exercise> _convertToPosts(List<dynamic> data) {
    return data.map((dynamic item) => Exercise.fromMap(item)).toList();
  }
}
