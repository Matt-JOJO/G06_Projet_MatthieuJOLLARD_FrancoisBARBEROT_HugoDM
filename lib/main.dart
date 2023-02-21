import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysteamapp/auth/authRepo.dart';
import 'package:mysteamapp/auth/auth_cubit.dart';
import 'package:mysteamapp/auth/auth_navigator.dart';
import 'package:mysteamapp/views/Wishlist.dart';
import 'package:mysteamapp/auth/forgot_password/forgot_view.dart';
import 'package:mysteamapp/views/home.dart';

// Amplify Flutter Packages
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:mysteamapp/auth/login/login_view.dart';
import 'package:mysteamapp/auth/sign_up/signup_view.dart';

// Generated in previous step
import 'amplifyconfiguration.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override


  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Steam App',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        primaryColor: Colors.black12,
      ),
      home: RepositoryProvider(
        create: (context) => AuthRepo(),
        child: BlocProvider(
          create: (context) => AuthCubit(),
          child: AuthNavigator(),
        )
      ),
    );
  }
}