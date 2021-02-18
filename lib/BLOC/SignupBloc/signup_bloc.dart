import 'dart:async';

import 'package:UFN/DATA/Repository/authRepository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpState());
  AuthenticationRepository authRepo = AuthenticationRepository();

  @override
  Stream<SignUpState> mapEventToState(
    SignUpEvent event,
  ) async* {
    if (event is EmailChanged) {
      print('Email Changed Triggered from Bloc: ${event.email}');
      if (RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(event.email)) {
        yield state.copyWith(email: event.email, emailError: "");
      } else {
        yield state.copyWith(
            email: event.email,
            emailError: "Please Ente a valid email address");
      }
    } else if (event is PasswordChanged) {
      if (event.password.length < 6) {
        yield state.copyWith(
            password: event.password,
            passwordError: "Password must be atleast 6 characters long");
      } else {
        yield state.copyWith(
          password: event.password,
          passwordError: "",
        );
      }
    } else if (event is ConfirmPasswordChanged) {
      if (event.confirmPassword != state.password) {
        yield state.copyWith(
            confirmPassword: event.confirmPassword,
            confirmPasswordError: "Passwords Dont Match!");
      } else {
        yield state.copyWith(
          password: event.confirmPassword,
          confirmPasswordError: "",
        );
      }
    } else if (event is AttemptSignUp) {
      print('SignUp Attemp Initiated');
      if (state.emailError == "" &&
          state.passwordError == "" &&
          RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(state.email) &&
          state.confirmPasswordError == "" &&
          state.password.length >= 6) {
        print('SignUp in Progress yielded');
        yield SignUpSuccess();
      } else
        yield state.copyWith(
          email: null,
          emailError: "Please Ente a valid email address",
          password: null,
          passwordError: "Password must be atleast 6 characters long",
          confirmPassword: null,
        );
    }
  }
}
