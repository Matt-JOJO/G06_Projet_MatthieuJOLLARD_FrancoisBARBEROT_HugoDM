

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysteamapp/auth/auth_cubit.dart';
import 'package:mysteamapp/auth/confirm/confirm_view.dart';
import 'package:mysteamapp/auth/forgot_password/forgot_view.dart';
import 'package:mysteamapp/auth/sign_up/signup_view.dart';

import 'login/login_view.dart';

class AuthNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>
      (builder: (context, state) {
          return Navigator(
            pages:[
              if (state == AuthState.login) MaterialPage(child: Login()),
              
              if (state == AuthState.signUp || state == AuthState.confirmSignup)... [
                MaterialPage(child: Signup()),
                
                if (state == AuthState.confirmSignup)
                  MaterialPage(child: ConfirmView())
              ],
              if (state == AuthState.forgotPassword) MaterialPage(child: NewPassword())
            ],
            onPopPage: (route, result) => route.didPop(result),
          );
        });
  }
}