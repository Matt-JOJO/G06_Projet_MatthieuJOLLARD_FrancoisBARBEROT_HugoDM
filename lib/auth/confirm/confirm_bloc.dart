

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysteamapp/auth/formSubmissionStatus.dart';
import 'package:mysteamapp/auth/login/login_state.dart';
import '../authRepo.dart';
import 'confirm_event.dart';

class ConfirmBloc extends Bloc<LoginEvent, LoginState>{
  final AuthRepo? authRepo;
  ConfirmBloc({ required this.authRepo}) : super(LoginState()){
    on<LoginEvent>(_onEvent);
  }

@override
  Future<void>_onEvent(LoginEvent event, Emitter<LoginState> emit) async{
  if (event is ConfirmEmailChanged){
    emit( state.copyWith(email: event.email));
  }
  else if (event is ConfirmPasswordChanged){
    emit( state.copyWith(password: event.password));
  }
  else if (event is ConfirmSubmitted){
    emit (state.copyWith(formStatus: FormSubmitting()));
  }
  try {
    await authRepo?.confirmSignup(username: '', confiramtionCode: '');
    emit( state.copyWith(formStatus: SubmissionSuccess()));
  }catch (e) {
    emit( state.copyWith(formStatus: SubmissionFailed(event as Exception)));
  }
}

}