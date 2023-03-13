import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysteamapp/session_cubit.dart';

class WaitingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(child: Column(
        children: [
          Text('Session view'),

          CircularProgressIndicator(),
        ],
      ),

      ),
    );
  }
}