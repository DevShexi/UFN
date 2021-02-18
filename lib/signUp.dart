import 'package:UFN/Widgets/inputField.dart';
import 'package:UFN/colors.dart';
import 'package:flutter/material.dart';
import 'Constants/constants.dart';
import 'Widgets/button.dart';
import 'login.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 185,
                ),
                Text(
                  'Welcome,',
                  style: kHeading26Black,
                ),
                Text(
                  'Create Accoount',
                  style: kHeading26Black,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      Text('Already have an account / '),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => Login(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 8.0),
                          child: Text(
                            'Login',
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
                  keyType: TextInputType.name,
                  obscure: true,
                  hint: "Password",
                  changeHandler: (e) {
                    print(e);
                  },
                ),
                InputField(
                  label: "Confirm Password",
                  keyType: TextInputType.name,
                  obscure: true,
                  hint: "COnfirm Password",
                  changeHandler: (e) {
                    print(e);
                  },
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
