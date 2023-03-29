import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysteamapp/session_cubit.dart';

/// this widget was used to disconnect a user from the app
/// It's no longer needed as the previous user is automatically signed out during the login

class SignOut extends StatefulWidget {
  const SignOut({super.key});

  @override
  State<SignOut> createState() => SignOutState();
}

class SignOutState extends State<SignOut> {
  Future<void> signOutCurrentUser() async {
    try {
      await Amplify.Auth.signOut();
      print("user disconnected");
    } on AuthException catch (e) {
      print(e.message);
    }
  }

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
            TextButton(
                onPressed: () =>
                    BlocProvider.of<SessionCubit>(context).signOut(),
                child: Text('Sign out'))
          ],
        ),
      ),
    );
  }
}
