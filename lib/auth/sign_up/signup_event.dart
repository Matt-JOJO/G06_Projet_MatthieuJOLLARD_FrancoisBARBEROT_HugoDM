abstract class SignupEvent{}

class SignupUsernameChanged extends SignupEvent{
  final String username;
  SignupUsernameChanged({required this.username});
}

class SignupEmailChanged extends SignupEvent{
  final String email;
  SignupEmailChanged({required this.email});
}
class SignupPrimaryPasswordChanged extends SignupEvent{
  final String primPassword;

  SignupPrimaryPasswordChanged({required this.primPassword});
}
class SignupSecondaryPasswordChanged extends SignupEvent{
  final String secPassword;

  SignupSecondaryPasswordChanged({required this.secPassword});
}
class SignupSubmitted extends SignupEvent{}