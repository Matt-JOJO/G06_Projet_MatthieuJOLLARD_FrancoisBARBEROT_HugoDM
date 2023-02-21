
class AuthRepo {
  Future<String> login({
    required String email,
    required String password,
  }) async {
    print('attempting login');
    await Future.delayed(Duration(seconds: 3));
    return 'username';
  }

  Future<void> signUp({
    required String username,
    required String email,
    required String password,
  }) async {
    await Future.delayed(Duration(seconds: 2));
  }

  Future<String> confirmSignup({
    required String username,
    required String confiramtionCode,
})async {
    await Future.delayed(Duration(seconds: 2));
    return 'abs';
  }

  Future<void> forgotPassword({
    required String email,
}) async {
    await Future.delayed(Duration(seconds: 2));
  }
  Future<void> signOut() async {
    await Future.delayed(Duration(seconds: 2));
  }
}
