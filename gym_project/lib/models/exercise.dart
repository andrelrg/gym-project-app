import 'package:flutter/foundation.dart';

//This class is a model containing the required data for an exercise.
class Exercise {
  const Exercise({
    @required this.name,
    @required this.repetition,
    @required this.imageUrl,
    @required this.series,
    @required this.description,
    @required this.recommendedWeight,
  });

  Exercise.fromMap(Map<String, dynamic> data)
      : name = data['name'],
        repetition = data['repetition'],
        imageUrl = data['imageUrl'],
        series = data['series'],
        description = data['description'],
        recommendedWeight = data['recommendedWeight'];

  final String name;
  final int repetition;
  final String imageUrl;
  final int series;
  final String description;
  final int recommendedWeight;
}