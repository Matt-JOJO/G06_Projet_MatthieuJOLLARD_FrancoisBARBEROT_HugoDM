

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysteamapp/auth/formSubmissionStatus.dart';
import 'package:mysteamapp/auth/sign_up/signup_state.dart';
import '../authRepo.dart';
import 'signup_event.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState>{
  final AuthRepo? authRepo;
  SignupBloc({ required this.authRepo}) : super(SignupState()){
    on<SignupEvent>(_onEvent);
  }

@override
  Future<void>_onEvent(SignupEvent event, Emitter<SignupState> emit) async{
  if (event is SignupEmailChanged){
    emit( state.copyWith(email: event.email));
  }
  else if (event is SignupUsernameChanged){
    emit(state.copyWith(username: event.username));
  }
  else if (event is SignupPrimaryPasswordChanged){
    emit( state.copyWith(password: event.primPassword));
  }
  else if (event is SignupSecondaryPasswordChanged){
    emit(state.copyWith(password: event.secPassword));
  }
  else if (event is SignupSubmitted){
    emit (state.copyWith(formStatus: FormSubmitting()));
  }
  try {
    await authRepo?.signUp(
        email: state.email,
        username: state.username,
        password: state.password,
    );
    emit( state.copyWith(formStatus: SubmissionSuccess()));
  }catch (e) {
    emit( state.copyWith(formStatus: SubmissionFailed(event as Exception)));
  }
}

}