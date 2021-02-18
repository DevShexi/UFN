import 'package:UFN/Constants/constants.dart';
import 'package:flutter/material.dart';

import 'Widgets/button.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('images/welcome.png'),
              SizedBox(
                height: 120.0,
              ),
              Text(
                'Ultra Fitness Nutrition',
                textAlign: TextAlign.center,
                style: kHeading26,
              ),
              SizedBox(height: 8),
              Text(
                // 'Ultra Fitness Nutrition',
                'One Stop Shop For Your Fitness and Nutrition Needs',
                style: TextStyle(
                  // color: primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Button(
                    label: "Continue",
                    color: primaryColor,
                    action: () {
                      Navigator.pushNamed(context, '/login');
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
