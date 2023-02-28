import 'package:flutter/material.dart';

class WaitingView extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}