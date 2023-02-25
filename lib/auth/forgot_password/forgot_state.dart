
import 'package:mysteamapp/auth/formSubmissionStatus.dart';

class ForgotState {
  final String email;
  bool get isEmailValid => email.contains('@');


  final FormSubmissionStatus formStatus;

  ForgotState({
    this.email = '',
    this.formStatus = const InitialFormStatus(),
  });

  ForgotState copyWith({
    String? email,

    FormSubmissionStatus? formStatus,
  }) {
    return ForgotState(
      email: email ?? this.email,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}
