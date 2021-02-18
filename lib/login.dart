import 'package:UFN/Widgets/button.dart';
import 'package:UFN/Widgets/inputField.dart';
import 'package:UFN/signUp.dart';
import 'package:flutter/material.dart';

import 'Constants/constants.dart';
import 'colors.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool showPassword = false;
  IconData icon = Icons.visibility;
  togglePasswordVisibility() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 200),
                Text(
                  'Hey,',
                  style: kHeading26Black,
                ),
                Text(
                  'Login Now',
                  style: kHeading26Black,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      Text('If you are new / '),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => SignUp(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 8.0),
                          child: Text(
                            'Create New',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InputField(
                  label: "Email",
                  keyType: TextInputType.emailAddress,
                  obscure: true,
                  hint: "Email",
                  changeHandler: (e) {
                    print(e);
                  },
                ),
                InputField(
                  label: "Password",
                  // icon: showPassword ? Icons.visibility : Icons.visibility_off,
                  // togglePasswordVisibility: togglePasswordVisibility,
                  keyType: TextInputType.name,
                  obscure: true,
                  hint: "Password",
                  changeHandler: (e) {
                    print(e);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      Text('Forgot Password / '),
                      InkWell(
                        onTap: () {
                          // Navigator.pushReplacement(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (BuildContext context) => SignUp(),
                          //   ),
                          // );
                          print('User requested to Reset the Password');
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 8.0),
                          child: Text(
                            'Reset',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    children: [
                      Button(
                          label: 'Login',
                          action: () {
                            print("form submitted");
                          },
                          color: red),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context, false);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 8.0),
                        child: Text(
                          'Cancel',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 35),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
