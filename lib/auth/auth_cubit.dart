import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysteamapp/auth/auth_credentials.dart';

import '../session_cubit.dart';

enum AuthState { login, signUp, forgotPassword, confirmSignup }

class AuthCubit extends Cubit<AuthState> {
  final SessionCubit sessionCubit;

  AuthCubit({required this.sessionCubit}) : super(AuthState.login);

  void showLogin() => emit(AuthState.login);

  void showSignup() => emit(AuthState.signUp);

  void showForgotPassword() => emit(AuthState.forgotPassword);

  void launchSession(AuthCredentials credentials) =>
      sessionCubit.showSession(credentials);
}
