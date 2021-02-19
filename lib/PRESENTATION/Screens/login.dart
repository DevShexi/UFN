import 'package:UFN/BLOC/LoginBloc/login_bloc.dart';
import 'package:UFN/PRESENTATION/Widgets/button.dart';
import 'package:UFN/PRESENTATION/Widgets/inputField.dart';
import 'package:UFN/PRESENTATION/Screens/signUp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Constants/constants.dart';
import '../../colors.dart';

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
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: Scaffold(
        body: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: red,
                  content: Text(
                    'Loggin Was Successful',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
            }
          },
          child: SafeArea(
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
                    BlocBuilder<LoginBloc, LoginState>(
                      builder: (context, state) {
                        return Column(
                          children: [
                            InputField(
                              label: "Email",
                              keyType: TextInputType.emailAddress,
                              obscure: false,
                              hint: "Email",
                              error: state.emailError,
                              changeHandler: (email) {
                                context
                                    .read<LoginBloc>()
                                    .add(EmailChanged(email: email));
                              },
                            ),
                            InputField(
                              label: "Password",
                              // icon: showPassword ? Icons.visibility : Icons.visibility_off,
                              // togglePasswordVisibility: togglePasswordVisibility,
                              keyType: TextInputType.name,
                              obscure: true,
                              hint: "Password",
                              error: state.passwordError,
                              changeHandler: (password) {
                                context
                                    .read<LoginBloc>()
                                    .add(PasswordChanged(password: password));
                              },
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
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
                                      print(
                                          'User requested to Reset the Password');
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 8.0),
                                      child: Text(
                                        'Reset',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 20.0),
                              child: Row(
                                children: [
                                  Button(
                                      label: 'Login',
                                      action: () {
                                        context.read<LoginBloc>().add(
                                              AttemptLogin(
                                                  email: state.email,
                                                  password: state.password),
                                            );
                                        // print("User Email: ${state.email}");
                                        // print("User Password: ${state.password}");
                                      },
                                      color: red),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
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
        ),
      ),
    );
  }
}
