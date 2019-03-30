import 'package:flutter/material.dart';

import 'no_content.dart';
import 'exercise_item.dart';
import 'models/exercise.dart';


//ExerciseList this class defines the list with elements(ExerciseItems)
class ExerciseList extends StatelessWidget {
  const ExerciseList(this.exercises);

  final Stream<List<Exercise>> exercises;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Exercise>>(
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