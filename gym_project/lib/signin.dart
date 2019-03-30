import 'package:flutter/material.dart';

class SignInFab extends StatelessWidget {
  const SignInFab();
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () => print('Tapped on sign in'),
      icon: Image.asset('assets/google_logo.ico', height: 24.0),
      label: const Text('Sign in with Google'),
    );
  }
}