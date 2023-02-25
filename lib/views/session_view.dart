import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysteamapp/session_cubit.dart';

class SessionView extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return  Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Session view'),
            TextButton(onPressed: () => BlocProvider.of<SessionCubit>(context).signOut(), child: Text('sign out'))
          ],
        ),
      ),
    );
  }
}