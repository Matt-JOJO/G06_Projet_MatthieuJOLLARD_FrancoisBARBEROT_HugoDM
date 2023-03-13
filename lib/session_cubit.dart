

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysteamapp/auth/auth_credentials.dart';
import 'package:mysteamapp/auth/auth_cubit.dart';
import 'package:mysteamapp/session_state.dart';

import 'auth/authRepo.dart';

class SessionCubit extends Cubit<SessionState>{
  final AuthRepo authRepo;
  SessionCubit({required this.authRepo}): super(UnknownSessionState()){
    attemptAutoLogin();
  }

  void attemptAutoLogin() async {
    try{
      final userId = await authRepo.attemptAutoLogin();
      final user = userId;
      if (userId == null){
        throw Exception('User not logged in');
      }
      emit(Authenticated(user: user));
      print("autoLog emit authenticated while signedOut");
    }on Exception{
      emit(Unauthenticated());
      print("exception autoLog");
    }

  }

  void showAuth() => emit(Unauthenticated());
  void showSession(AuthCredentials credentials){
    // final user = dataRepo.getUser(credentials.userId);*
    final user = credentials.email;
    emit(Authenticated(user: user));
  }
  void signOut(){
    authRepo.signOut;
    emit(Unauthenticated());
  }
}