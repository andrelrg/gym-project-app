import 'services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'exercices_list.dart';
import 'models/exercise.dart';
import 'dart:convert';


class SignIn extends StatelessWidget {
  const SignIn({
    @required this.auth,
  });

  final Auth auth;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () => _handleSignIn(context),
      icon: Image.asset('assets/google_logo.ico', height: 24.0),
      label: const Text('Logar com o Google'),
    );
  }

  void _handleSignIn(BuildContext context) {
    auth.signInWithGoogle()
        .then((FirebaseUser user) =>  Navigator.push(context, new MaterialPageRoute(builder: (context) =>
    new Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(""),
        ),
        elevation: 0.0,
      ),

      body: ExerciseList(_loadPosts(context)),
    )
    )
    )
    );


//     
  }
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