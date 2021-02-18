part of 'signup_bloc.dart';

class SignUpState extends Equatable {
  final bool valid;
  final email;
  final password;
  final confirmPassword;
  final emailError;
  final passwordError;
  final confirmPasswordError;
  SignUpState(
      {this.email,
      this.password,
      this.emailError,
      this.passwordError,
      this.confirmPassword,
      this.confirmPasswordError,
      this.valid});

  SignUpState copyWith(
      {email,
      password,
      confirmPassword,
      emailError,
      passwordError,
      confirmPasswordError,
      valid}) {
    return SignUpState(
      email: email ?? this.email,
      emailError: emailError ?? this.emailError,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      passwordError: passwordError ?? this.passwordError,
      valid: valid ?? this.valid,
      confirmPasswordError: confirmPasswordError ?? this.confirmPasswordError,
    );
  }

  @override
  List<Object> get props => [
        email,
        password,
        confirmPassword,
        emailError,
        passwordError,
        confirmPasswordError,
        valid
      ];
}

class SignUpSuccess extends SignUpState {
  SignUpSuccess();
}

class SignUpFailed extends SignUpState {
  SignUpFailed();
}
