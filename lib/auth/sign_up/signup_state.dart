
import 'package:mysteamapp/auth/formSubmissionStatus.dart';

class SignupState {
  final String username;
  bool get isUsernameValid => username.length > 3;
  final String email;
  bool get isEmailValid => email.contains('@');
  final String password;
  bool get isPasswordValid => password.length > 6;
  final String passwordCheck;
  bool get isPasswordCheckedValid => passwordCheck.length >6;

  final FormSubmissionStatus formStatus;

  SignupState({
    this.username = '',
    this.email = '',
    this.password = '',
    this.passwordCheck = '',
    this.formStatus = const InitialFormStatus(),
  });

  SignupState copyWith({
    String? username,
    String? email,
    String? password,
    String? passwordCheck,
    FormSubmissionStatus? formStatus,
  }) {
    return SignupState(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      passwordCheck: passwordCheck ?? this.passwordCheck,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}
