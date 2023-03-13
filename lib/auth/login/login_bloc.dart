

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysteamapp/auth/auth_credentials.dart';
import 'package:mysteamapp/auth/auth_cubit.dart';

import 'package:mysteamapp/auth/formSubmissionStatus.dart';
import 'package:mysteamapp/auth/login/login_state.dart';
import '../authRepo.dart';
import 'login_event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState>{
  final AuthRepo authRepo;
  final AuthCubit authCubit;
  LoginBloc( { required this.authRepo,required this.authCubit,}) : super(LoginState()){
    on<LoginEvent>(_onEvent);
  }

@override
  Future<void>_onEvent(LoginEvent event, Emitter<LoginState> emit) async{
  if (event is LoginEmailChanged){
    emit( state.copyWith(email: event.email));
  }
  else if (event is LoginPasswordChanged){
    emit( state.copyWith(password: event.password));
  }/// Form submitted
  else if (event is LoginSubmitted){
    emit (state.copyWith(formStatus: FormSubmitting()));
  }
  try {
    final userId = await authRepo.login(
      email: state.email,
      password: state.password,
    );
    emit( state.copyWith(formStatus: SubmissionSuccess()));
    authCubit.launchSession(AuthCredentials( email: state.email, password: state.password));
  }catch (e) {
    emit( state.copyWith(formStatus: SubmissionFailed(event as Exception)));
  }
}

}