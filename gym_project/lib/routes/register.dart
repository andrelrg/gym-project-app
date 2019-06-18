
//ExerciseList this class defines the list with elements(ExerciseItems)
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gym_project/domains/usuario.dart';
import 'package:gym_project/forms/register.dart';

class Registration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Usuario user = ModalRoute.of(context).settings.arguments;
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: new AppBar(
          title: new Text("Crie sua conta!"),
        ),
        body: new RegistrationForm(user)
    );
  }
}