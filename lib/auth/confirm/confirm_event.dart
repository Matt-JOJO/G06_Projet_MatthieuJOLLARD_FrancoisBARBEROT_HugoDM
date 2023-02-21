abstract class LoginEvent{}

class ConfirmEmailChanged extends LoginEvent{
  final String email;
  ConfirmEmailChanged({required this.email});
}
class ConfirmPasswordChanged extends LoginEvent{
  final String password;

  ConfirmPasswordChanged({required this.password});
}
class ConfirmSubmitted extends LoginEvent{}