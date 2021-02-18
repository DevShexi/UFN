import 'package:UFN/signUp.dart';
import 'package:UFN/welcome.dart';
import 'package:flutter/material.dart';
import 'colors.dart';
import 'login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Welcome(),
        '/login': (context) => Login(),
        '/signup': (context) => SignUp(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: red,
        //accentColor: Color(0xFFfdcd83),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: Welcome(),
    );
  }
}
