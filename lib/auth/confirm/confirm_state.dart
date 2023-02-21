
import 'package:mysteamapp/auth/formSubmissionStatus.dart';

class ConfirmState {
  final String email;
  bool get isEmailValid => email.contains('@');
  final String password;
  bool get isPasswordValid => password.length > 6;

  final FormSubmissionStatus formStatus;

  ConfirmState({
    this.email = '',
    this.password = '',
    this.formStatus = const InitialFormStatus(),
  });

  ConfirmState copyWith({
    String? email,
    String? password,
    FormSubmissionStatus? formStatus,
  }) {
    return ConfirmState(
      email: email ?? this.email,
      password: password ?? this.password,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}
