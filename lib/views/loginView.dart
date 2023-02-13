import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter/material.dart';

import '../amplifyconfiguration.dart';
/*
class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.menu),
            SizedBox(
              width: 10,
            ),
            Text('Sign out')
          ],
        ),
      ),
    );
  }

  // Create a boolean for checking the sign in status
  bool isSignedIn = false;

  Future<void> signInUser(String username, String password) async {
    try {
      final result = await Amplify.Auth.signIn(
        username: username,
        password: password,
      );

      setState(() {
        isSignedIn = res.isSignedIn;
      });
    } on AuthException catch (e) {
      safePrint(e.message);
    }
  }
}
*/