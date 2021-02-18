part of 'login_bloc.dart';

class LoginState extends Equatable {
  final bool valid;
  final email;
  final password;
  final emailError;
  final passwordError;
  LoginState(
      {this.email,
      this.password,
      this.emailError,
      this.passwordError,
      this.valid});

  LoginState copyWith({email, password, emailError, passwordError, valid}) {
    return LoginState(
      email: email ?? this.email,
      emailError: emailError ?? this.emailError,
      password: password ?? this.password,
      passwordError: passwordError ?? this.passwordError,
      valid: valid ?? this.valid,
    );
  }

  @override
  List<Object> get props => [email, password, emailError, passwordError, valid];
}

class LoginSuccess extends LoginState {
  LoginSuccess();
}

class LoginFailed extends LoginState {
  LoginFailed();
}
