import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysteamapp/auth/authRepo.dart';
import 'package:mysteamapp/auth/confirm/confirm_bloc.dart';

class ConfirmView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: BlocProvider(
        create: (context)=> ConfirmBloc(authRepo: context.read<AuthRepo>(),
        ),
      ),
    );
  }

}
/// faire la page de confirmation d'inscription