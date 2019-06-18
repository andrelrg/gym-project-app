import 'auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gym_project/domains/usuario.dart';

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

  void _handleSignIn(BuildContext context) async {
    Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text('Logando ..')));
    await auth.signInWithGoogle().then((FirebaseUser user) =>
      Navigator.pushReplacementNamed(
        context,
        '/register',
        arguments: Usuario(user.email, user.photoUrl, user.displayName)
      )

    );

  }
}

