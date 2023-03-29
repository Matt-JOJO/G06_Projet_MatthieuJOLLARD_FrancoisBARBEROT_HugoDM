import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysteamapp/auth/forgot_password/forgot_event.dart';
import '../authRepo.dart';
import '../auth_cubit.dart';
import '../formSubmissionStatus.dart';
import 'forgot_bloc.dart';
import 'forgot_state.dart';

/// the backend of this page doesn't work

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final _formKey = GlobalKey<FormState>();
  @override



  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A2025),
      body: BlocProvider(
        create: (context) => ForgotBloc(
          authRepo: context.read<AuthRepo>(),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            _form(context),
            _navigateLogin(),
          ],
        ),
      ),
    );
  }

  Widget _form(BuildContext context) {
    return BlocListener<ForgotBloc, ForgotState>(
      listener: (context, state) {
        final formStatus = state.formStatus;
        if (formStatus is SubmissionFailed) {
          _showError(context, formStatus.exception.toString());
        }
      },
      child: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),

          child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
            _primText(),
            SizedBox(
              height: 20,
            ),
            _subText(),
            SizedBox(
              height: 60,
            ),
            _emailField(),
            SizedBox(
              height: 60,
            ),
            _button(),
          ]),
        ),
      ),
    );
  }

  Widget _primText() {
    return const Text(
      "Mot de passe oublié",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 36,
        fontFamily: 'GoogleSans',
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  Widget _subText() {
    return const Text(
      "Veuillez saisir votre email afin de réinitialiser votre mot de passe",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 20,
        fontFamily: 'GoogleSans',
        color: Colors.white,
      ),
    );
  }

  Widget _emailField() {
    return BlocBuilder<ForgotBloc, ForgotState>(builder: (context, state) {
    return TextFormField(
      textAlignVertical: TextAlignVertical.center,
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(
        color: Colors.white,
      ),
      // controller: field,
      decoration: const InputDecoration(
        fillColor: Color(0xFF1E262C),
        filled: true,
        label: Center(
          child: Text(
            "E-mail",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'GoogleSans',
              color: Colors.white,
            ),
          ),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))),
      ),
      validator: (value) => state.isEmailValid ? null : 'Email incorrect',
      onChanged: (value) =>
          context.read<ForgotBloc>().add(
            ForgotEmailChanged(email: value),
          ),
    );
    });
  }

  Widget _button() {
    return BlocBuilder<ForgotBloc, ForgotState>(builder: (context, state) {
      return state.formStatus is FormSubmitting
          ? const CircularProgressIndicator()
          : InkWell(
        onTap: () {
          if (_formKey.currentState!.validate()) {
            context.read<ForgotBloc>().add(ForgotSubmitted());
          }
        },
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.indigo,
            borderRadius: BorderRadius.circular(5),
          ),
          child: const Center(
            child: Text(
              "Renvoyer mon mot de passe",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontFamily: 'GoogleSans',
                  fontWeight: FontWeight.normal),
            ),
          ),
        ),
      );
    });
  }
  Widget _navigateLogin(){
    return SafeArea(child: TextButton(child: Text('La mémoire vous est revenue ? Se connecter'),onPressed: ()=> context.read<AuthCubit>().showLogin(),));
  }
  void _showError(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
