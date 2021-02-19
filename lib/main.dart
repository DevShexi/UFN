import 'package:UFN/PRESENTATION/Screens/home.dart';
import 'package:UFN/PRESENTATION/Screens/signUp.dart';
import 'package:UFN/PRESENTATION/Screens/welcome.dart';
import 'package:flutter/material.dart';
import 'colors.dart';
import 'PRESENTATION/Screens/login.dart';

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
        '/home': (context)=> Home(),
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
