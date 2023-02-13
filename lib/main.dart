import 'package:flutter/material.dart';
import 'package:mysteamapp/views/home.dart';

// Amplify Flutter Packages
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

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
      home: HomePage(),
    );
  }
}