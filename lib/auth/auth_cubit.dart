


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysteamapp/auth/auth_credentials.dart';

enum AuthState {login, signUp,forgotPassword, confirmSignup}


class AuthCubit extends Cubit<AuthState>{
  AuthCubit() : super(AuthState.login);
  late AuthCredentials credentials;
  void showLogin() => emit(AuthState.login);
  void showSignup() => emit(AuthState.signUp);
  void showForgotPassword() => emit(AuthState.forgotPassword);
  void showConfirm({
    required String username,
    required String email,
    required String password,
}){
    credentials = AuthCredentials(username: username, email: email,);
    emit(AuthState.confirmSignup);
  }
}