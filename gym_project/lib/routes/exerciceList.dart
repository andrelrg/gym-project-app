import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gym_project/components/drawer.dart';

import 'package:gym_project/components/no_content.dart';
import 'package:gym_project/models/exercise.dart';
import 'package:gym_project/domains/usuario.dart';
import 'package:gym_project/components/exercise_item.dart';



//ExerciseList this class defines the list with elements(ExerciseItems)
class ExerciseList extends StatelessWidget {

  Stream<List<Exercise>> exercises;

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

  @override
  Widget build(BuildContext context) {
    this.exercises = _loadPosts(context);
    final Usuario user = ModalRoute.of(context).settings.arguments;

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Exercicios"),
      ),
      body: new StreamBuilder<List<Exercise>>(
        stream: exercises,
        builder: (BuildContext context, AsyncSnapshot<List<Exercise>> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Text('Loading...');
            default:
              if (snapshot.data.isEmpty) {
                return const NoContent();
              }
              return _itemList(snapshot.data);
          }
        },
      ),
      drawer: LeftDrawer(user),
    );

  }

  ListView _itemList(List<Exercise> items) {
    return ListView(
      children: items.map((Exercise exercise) {
        return Container(
          padding: const EdgeInsets.fromLTRB(26.0, 26.0, 26.0, 8.0),
          child: ExerciseItem(exercise),
        );
      }).toList(),
    );
  }
}