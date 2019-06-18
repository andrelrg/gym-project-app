import 'package:flutter/material.dart';

import 'package:gym_project/models/exercise.dart';


//ExerciseItem This class is each Item that appears in the list
class ExerciseItem extends StatelessWidget {
  const ExerciseItem(this.exercise);

  final Exercise exercise;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ClipRRect(
          child: Image.network(exercise.imageUrl),
          borderRadius: BorderRadius.circular(10.0),
        ),
        const SizedBox(height: 8.0),
        Text(
          exercise.name,
          style: Theme.of(context).textTheme.headline,
        ),
        const SizedBox(height: 8.0),
        Text(
          exercise.description,
          style: Theme.of(context).textTheme.body2,
        ),
        Text(
          'Series: ' + exercise.series.toString(),
          style: Theme.of(context).textTheme.body1,
        ),
        Text(
          'Repetições por série: ' + exercise.repetition.toString(),
          style: Theme.of(context).textTheme.body1,
        ),
        Text(
          'Peso recomendado ' + exercise.recommendedWeight.toString(),
          style: Theme.of(context).textTheme.body1,
        ),
      ],
    );
  }
}
