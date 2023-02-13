import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter/material.dart';

import '../amplifyconfiguration.dart';

/*
// Create a boolean for checking the sign up status
bool isSignUpComplete = false;



Future<void> signUpUser() async {
  try {
    final userAttributes = <CognitoUserAttributeKey, String>{
      CognitoUserAttributeKey.email: 'email@domain.com',

      // additional attributes as needed
    };
    final result = await Amplify.Auth.signUp(
      username: 'myusername',
      password: 'mysupersecurepassword',
      options: CognitoSignUpOptions(userAttributes: userAttributes),
    );
    setState(() {
      isSignUpComplete = result.isSignUpComplete;
    });
  } on AuthException catch (e) {
    safePrint(e.message);
  }
}


Future<void> confirmUser() async {
  try {
    final result = await Amplify.Auth.confirmSignUp(
        username: 'myusername',
        confirmationCode: '123456'
    );

    setState(() {
      isSignUpComplete = result.isSignUpComplete;
    });

  } on AuthException catch (e) {
    safePrint(e.message);
  }
}
*/
