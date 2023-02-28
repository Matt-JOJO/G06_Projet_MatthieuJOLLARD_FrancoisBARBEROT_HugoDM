

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysteamapp/auth/formSubmissionStatus.dart';
import 'package:mysteamapp/auth/forgot_password/forgot_state.dart';
import '../authRepo.dart';
import 'forgot_event.dart';

class ForgotBloc extends Bloc<ForgotEvent, ForgotState>{
  final AuthRepo? authRepo;
  ForgotBloc({ required this.authRepo}) : super(ForgotState()){
    on<ForgotEvent>(_onEvent);
  }

@override
  Future<void>_onEvent(ForgotEvent event, Emitter<ForgotState> emit) async{
  if (event is ForgotEmailChanged){
    emit( state.copyWith(email: event.email));
  }

  else if (event is ForgotSubmitted){
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