import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter/material.dart';

import '../../amplifyconfiguration.dart';

class SignOut extends StatefulWidget {
  @override
  State<SignOut> createState() => _SignOutState();
}


class _SignOutState extends State<SignOut> {


  Future<void> signOutCurrentUser() async {
  try {
    await Amplify.Auth.signOut();
  } on AuthException catch (e) {
    print(e.message);
  }
}



  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.menu),
            SizedBox(width: 10,),
            Text('Sign out')
          ],) ,
      ),
    );
  }
}


