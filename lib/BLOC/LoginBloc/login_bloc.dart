import 'dart:async';

import 'package:UFN/DATA/Repository/authRepository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState());
  AuthenticationRepository authRepo = AuthenticationRepository();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
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
    } else if (event is AttemptLogin) {
      if (state.email != null &&
          state.password != null &&
          RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(state.email) &&
          state.password.length >= 6) {
        yield ValidateUserLogin(email: event.email, password: event.password);
      } else
        yield state.copyWith(
            email: null,
            emailError: "Please Ente a valid email address",
            password: null,
            passwordError: "Password must be atleast 6 characters long");
    } else if (event is ValidateLogin) {
      final response = await (authRepo.loginUser(event.email, event.password));
      print(response);
      if (response['userFound'] == false) {
        yield NoUserExists(emailError: response['message']);
      } else if (response['passwordMatched'] == false) {
        yield InvalidPassword(passwordError: response['message']);
      } else
        yield LoginSuccess();
    }
  }
}
