///Here we handle the event happening in the login form
abstract class LoginEvent{}

class LoginEmailChanged extends LoginEvent{
  final String email;
  LoginEmailChanged({required this.email});
}
class LoginPasswordChanged extends LoginEvent{
  final String password;

  LoginPasswordChanged({required this.password});
}
class LoginSubmitted extends LoginEvent{}