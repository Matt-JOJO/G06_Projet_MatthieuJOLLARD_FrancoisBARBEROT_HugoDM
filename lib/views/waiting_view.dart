import 'package:flutter/material.dart';

/// this widget is shown during autologin attempts. As the function is currently disabled you will not see it.

class WaitingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: const [
            Text('Session view'),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
