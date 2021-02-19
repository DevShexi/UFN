import 'package:UFN/BLOC/SignupBloc/signup_bloc.dart';
import 'package:UFN/PRESENTATION/Widgets/button.dart';
import 'package:UFN/PRESENTATION/Widgets/inputField.dart';
import 'package:UFN/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Constants/constants.dart';
import 'login.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc(),
      child: Scaffold(
        body: SafeArea(
          child: BlocListener<SignUpBloc, SignUpState>(
            listener: (context, state) {
              if (state is SignUpSuccess) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('SignUp Success'),
                  ),
                );
              }
            },
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
                    BlocBuilder<SignUpBloc, SignUpState>(
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
                                context.read<SignUpBloc>().add(
                                      EmailChanged(email: email),
                                    );
                              },
                            ),
                            InputField(
                              label: "Password",
                              keyType: TextInputType.name,
                              obscure: true,
                              hint: "Password",
                              error: state.passwordError,
                              changeHandler: (password) {
                                context.read<SignUpBloc>().add(
                                      PasswordChanged(password: password),
                                    );
                              },
                            ),
                            InputField(
                              label: "Confirm Password",
                              keyType: TextInputType.name,
                              obscure: true,
                              hint: "Confirm Password",
                              error: state.confirmPasswordError,
                              changeHandler: (confirmPassword) {
                                context.read<SignUpBloc>().add(
                                      ConfirmPasswordChanged(
                                          confirmPassword: confirmPassword),
                                    );
                              },
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 20.0),
                              child: Row(
                                children: [
                                  Button(
                                      label: 'Login',
                                      action: () {
                                        context.read<SignUpBloc>().add(
                                              AttemptSignUp(
                                                  email: state.email,
                                                  password: state.password,
                                                  confirmPassword:
                                                      state.confirmPassword),
                                            );
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
