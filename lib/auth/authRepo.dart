import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

/// Repository where i keep my functions handling the autologin function
class AuthRepo {
  Future<String> _getUserAttributes() async {
    try {
      final attributes = await Amplify.Auth.fetchUserAttributes();
      // we get the first element in the attribute where the key is sub
      final userId = attributes
          .first
          .value;
      return userId;
    } catch (e) {
      throw e;
    }
  }

  Future<String?> attemptAutoLogin() async {
    try {

      final sessionOut = await Amplify.Auth.signOut();
      final session;
      if (sessionOut == true){
        session = await Amplify.Auth.fetchAuthSession();
        return session.isSignedIn ?  (await _getUserAttributes()): null;
      }
      /// if you want to enable the autoLogin you need to uncomment the following code
      /// and comment the previous one
      /*
      final session;
      session = await Amplify.Auth.fetchAuthSession();
      return session.isSignedIn ?  (await _getUserAttributes()): null;
      */

    } catch (e) {
      throw e;
    }
  }

  Future<String?> login({
    required String email,
    required String password,
  }) async {
    try{
      final result = await Amplify.Auth.signIn(username: email.trim(), password: password.trim(),);
      return result.isSignedIn ? (await _getUserAttributes()) : null;
    }catch(e){
      throw e;
    }
  }

  Future<bool> signUp({
    required String username,
    required String email,
    required String password,
  }) async {

    final Map<CognitoUserAttributeKey,String> userAttributes = {
      CognitoUserAttributeKey.email: email.trim(),
    };

    try{
      final result = await Amplify.Auth.signUp(username: username.trim(), password: password.trim(), options: CognitoSignUpOptions(userAttributes: userAttributes),);
      return result.isSignUpComplete;
    }catch(e){
      throw e;
    }

  }


  Future<void> forgotPassword({
    required String email,
  }) async {
    await Future.delayed(Duration(seconds: 2));
  }

  Future<void> signOut() async {
    await Amplify.Auth.signOut();
  }
}
