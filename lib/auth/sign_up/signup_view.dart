import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mysteamapp/auth/formSubmissionStatus.dart';
import 'package:mysteamapp/auth/sign_up/signup_event.dart';
import 'package:mysteamapp/auth/sign_up/signup_bloc.dart';
import 'package:mysteamapp/auth/sign_up/signup_state.dart';

import '../../amplifyconfiguration.dart';
import '../authRepo.dart';

class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  // final _signUpField

  @override
  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A2025),
      body: BlocProvider(
        create: (context) =>
            SignupBloc(
              authRepo: context.read<AuthRepo>(),
            ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            _signupForm(),
          ],
        ),
      ),
    );
  }

  Widget _signupForm() {
    return BlocListener<SignupBloc, SignupState>(
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _primaryText(),
              const SizedBox(
                height: 20,
              ),
              _subText(),
              const SizedBox(
                height: 50,
              ),

              ///Name input///
              _usernameField(),
              const SizedBox(
                height: 7,
              ),

              ///Email input///
              _emailField(),
              const SizedBox(
                height: 7,
              ),

              ///Field for password #1///
              _passwordField(),
              const SizedBox(
                height: 7,
              ),

              ///Field for password #2///
              _passwordCheck(),

              const SizedBox(
                height: 7,
              ),

              ///signup button///
              _signupButton(),
            ],
          ),
        ),
      ),
    );
  }


  Widget _primaryText() {
    return const Text(
      "Inscription",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 40,
        fontFamily: 'GoogleSans',
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  Widget _subText() {
    return const Text(
      "Veuillez saisir ces différentes informations, afin que vos listes soient sauvegardées.",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 18,
        fontFamily: 'GoogleSans',
        color: Colors.white,
      ),
    );
  }

  Widget _usernameField() {
    return BlocBuilder<SignupBloc, SignupState>(builder: (context, state) {
      return TextFormField(
        textAlignVertical: TextAlignVertical.center,
        keyboardType: TextInputType.name,
        style: const TextStyle(
          color: Colors.white,
        ),
        // controller: field,
        decoration: const InputDecoration(
          fillColor: Color(0xFF1E262C),
          filled: true,
          label: Center(
            child: Text(
              "Nom d'utilisateur",
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
        validator: (value) => state.isUsernameValid ? null : 'Pseudo incorrect',
        onChanged: (value) =>
            context.read<SignupBloc>().add(
              SignupUsernameChanged(username: value),
            ),
      );
    });
  }

  Widget _emailField() {
    return BlocBuilder<SignupBloc, SignupState>(builder: (context, state) {
      return TextFormField(
        textAlignVertical: TextAlignVertical.center,
        keyboardType: TextInputType.emailAddress,
        style: const TextStyle(
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
            context.read<SignupBloc>().add(
              SignupEmailChanged(email: value),
            ),
      );
    });
  }

  Widget _passwordField() {
    return BlocBuilder<SignupBloc, SignupState>(builder: (context, state) {
      return TextFormField(
        // controller: password,
        textAlignVertical: TextAlignVertical.center,
        keyboardType: TextInputType.visiblePassword,

        style: const TextStyle(
          color: Colors.white,
        ),

        decoration: InputDecoration(
          fillColor: Color(0xFF1E262C),
          filled: true,
          label: const Center(
            child: Text(
              "Mot de passe",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'GoogleSans',
                color: Colors.white,
              ),
            ),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
        ),
        validator: (value) =>
        state.isPasswordValid ? null : 'Mot de passe incorrect',
        onChanged: (value) =>
            context.read<SignupBloc>().add(
              SignupPrimaryPasswordChanged(primPassword: value),
            ),
      );
    });
  }

  Widget _passwordCheck() {
    return BlocBuilder<SignupBloc, SignupState>(builder: (context, state) {
      return TextFormField(
        // controller: password,
        textAlignVertical: TextAlignVertical.center,
        keyboardType: TextInputType.visiblePassword,

        style: const TextStyle(
          color: Colors.white,
        ),

        decoration: InputDecoration(
          fillColor: Color(0xFF1E262C),
          filled: true,
          label: const Center(
            child: Text(
              "Confirmer votre mot de passe",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'GoogleSans',
                color: Colors.white,
              ),
            ),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
        ),
        validator: (value) =>
        state.isPasswordCheckedValid == 0
            ? null
            : 'Veuillez écrire le même mot de passe',
        onChanged: (value) =>
            context.read<SignupBloc>().add(
              SignupPrimaryPasswordChanged(primPassword: value),
            ),
      );
    });
  }

  Widget _signupButton() {
    return BlocBuilder<SignupBloc, SignupState>(builder: (context, state) {
      return state.formStatus is FormSubmitting
          ? const CircularProgressIndicator()
          : InkWell(
        onTap: () {
          if (_formKey.currentState!.validate()) {
            context.read<SignupBloc>().add(SignupSubmitted());
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
              "Se connecter",
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

  void _showError(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
} /// fin de la classe

/*

// Create a boolean for checking the sign up status
bool isSignUpComplete = false;



Future<void> signUpUser() async {
  try {
    final userAttributes = <CognitoUserAttributeKey, String>{
      CognitoUserAttributeKey.email: 'email@domain.com',

      // additional attributes as needed
    };
    final result = await Amplify.Auth.signUp(
      username: 'myusername',
      password: 'mysupersecurepassword',
      options: CognitoSignUpOptions(userAttributes: userAttributes),
    );
    setState(() {
      isSignUpComplete = result.isSignUpComplete;
    });
  } on AuthException catch (e) {
    safePrint(e.message);
  }
}


Future<void> confirmUser() async {
  try {
    final result = await Amplify.Auth.confirmSignUp(
        username: 'myusername',
        confirmationCode: '123456'
    );

    setState(() {
      isSignUpComplete = result.isSignUpComplete;
    });

  } on AuthException catch (e) {
    safePrint(e.message);
  }
}
*/
