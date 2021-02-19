import 'dart:convert';

import 'package:UFN/DATA/Repository/authRepository.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        child: Center(
          child: RaisedButton(
              onPressed: () async {
                AuthenticationRepository authRepo =
                    new AuthenticationRepository();
                final String email = "damon@gmail.com";
                final String password = "123456";
                authRepo.loginUser(email, password);
              },
              child: Text('Get Token')),
        ),
      ),
    );
  }
}
