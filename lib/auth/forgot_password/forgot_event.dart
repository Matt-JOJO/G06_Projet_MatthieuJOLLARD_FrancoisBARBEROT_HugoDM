abstract class ForgotEvent{}

class ForgotEmailChanged extends ForgotEvent{
  final String email;
  ForgotEmailChanged({required this.email});
}

class ForgotSubmitted extends ForgotEvent{}