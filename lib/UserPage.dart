import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context).settings.arguments;

    String email = data["email"];
    String token = data["token"];

    return Scaffold(
      appBar: AppBar(
        title: Text('User Page'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Text('E-mail: $email'),
            Text('Token: $token'),
          ],
        ),
      ),
    );
  }
}
