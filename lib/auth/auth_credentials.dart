
/// Credentials needed to launch a session

class AuthCredentials {
  final String? username;
  final String email;
  final String password;
  String? userId;

  AuthCredentials({
    this.username,
    required this.email,
    required this.password,
    this.userId,
});
}