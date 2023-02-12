import 'package:flutter/material.dart';
import 'package:mysteamapp/views/home.dart';

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