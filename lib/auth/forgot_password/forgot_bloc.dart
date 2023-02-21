

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysteamapp/auth/formSubmissionStatus.dart';
import 'package:mysteamapp/auth/forgot_password/forgot_state.dart';
import '../authRepo.dart';
import 'forgot_event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState>{
  final AuthRepo? authRepo;
  LoginBloc({ required this.authRepo}) : super(LoginState()){
    on<LoginEvent>(_onEvent);
  }

@override
  Future<void>_onEvent(LoginEvent event, Emitter<LoginState> emit) async{
  if (event is LoginEmailChanged){
    emit( state.copyWith(email: event.email));
  }
  else if (event is LoginPasswordChanged){
    emit( state.copyWith(password: event.password));
  }
  else if (event is LoginSubmitted){
    emit (state.copyWith(formStatus: FormSubmitting()));
  }
  try {
    await authRepo?.forgotPassword(email: '');
    emit( state.copyWith(formStatus: SubmissionSuccess()));
  }catch (e) {
    emit( state.copyWith(formStatus: SubmissionFailed(event as Exception)));
  }
}

}