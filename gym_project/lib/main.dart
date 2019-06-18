
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:gym_project/routes/home.dart';
import 'package:gym_project/routes/register.dart';

import 'routes/exerciceList.dart';


import 'services/auth.dart';
import 'signin.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.black,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(new GymProject());
}

class GymProject extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,

      home: MyHomePage(title: 'Gym Project'),
      routes: {
        '/home': (context) => new MyHomePage(title: 'Gym Project'),
        '/register': (context) => new Registration(),
        '/list': (context) => new ExerciseList(),

      },
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white,
        accentColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
      ),
    );
  }
}


