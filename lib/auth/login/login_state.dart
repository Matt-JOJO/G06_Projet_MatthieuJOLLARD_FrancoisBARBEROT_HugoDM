
import 'package:mysteamapp/auth/formSubmissionStatus.dart';

/// this file allows us to handle the states of the login form

class LoginState {
  final String email;
  bool get isEmailValid => email.contains('@');
  final String password;
  bool get isPasswordValid => password.length > 6;

  final FormSubmissionStatus formStatus;

  LoginState({
    this.email = '',
    this.password = '',
    this.formStatus = const InitialFormStatus(),
  });

  LoginState copyWith({
    String? email,
    String? password,
    FormSubmissionStatus? formStatus,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}
