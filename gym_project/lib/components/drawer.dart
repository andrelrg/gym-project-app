

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gym_project/domains/usuario.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer(this.user);
  final Usuario user;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: new Text(user.name),
            accountEmail: new Text(user.email),
            currentAccountPicture: new CircleAvatar(
              backgroundImage: new NetworkImage(user.photoUrl),
            ),
          ),
          FlatButton(
            onPressed: () {

            },
            child: Text("Conta")
          ),
          FlatButton(
            onPressed: () {
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text('Logando ..')));
              Navigator.pushReplacementNamed(context, '/home');
            },
            child: Text("Logout"),
          )
        ],
      ),
    );
  }
}