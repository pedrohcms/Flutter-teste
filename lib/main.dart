import 'package:flutter/material.dart';
import 'package:flutterapp/UserPage.dart';
import 'package:flutterapp/login.page.dart';
import 'package:flutterapp/reset-password.page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'tcc',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: LoginPage(),
      initialRoute: '/',
      routes: {
        '/reset': (context) => ResetPasswordPage(),
        '/user_page': (context) => UserPage(),
      },
    );
  }
}
