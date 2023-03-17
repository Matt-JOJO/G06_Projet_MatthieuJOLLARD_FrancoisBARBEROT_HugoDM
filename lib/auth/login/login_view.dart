
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysteamapp/auth/auth_cubit.dart';
import 'package:mysteamapp/auth/formSubmissionStatus.dart';
import 'package:mysteamapp/auth/login/login_bloc.dart';
import 'package:mysteamapp/auth/login/login_event.dart';
import 'package:mysteamapp/auth/login/login_state.dart';
import 'package:mysteamapp/views/widgets/signOut.dart';


import '../authRepo.dart';

class Login extends StatefulWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  final _formKey = GlobalKey<FormState>();

  // final _loginField
  bool _obscureText = false;

  void _showPassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();


  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFF1A2025),
      body: BlocProvider(
        create: (context) => LoginBloc(
          authRepo: context.read<AuthRepo>(),
          authCubit: context.read<AuthCubit>(),
        ),
        //child : _loginForm(),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [

            _loginForm(),
            _forgotPassword( ),
          ],
        ),
      ),
    );
  }

  Widget _loginForm() {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        final formStatus = state.formStatus;
        if (formStatus is SubmissionFailed) {
          _showError(context, formStatus.exception.toString());
        }
      },
      child: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _primaryText(),
                SizedBox(
                  height: 20,
                ),
                _subText(),
                SizedBox(
                  height: 50,
                ),
                _emailField(),
                SizedBox(
                  height: 10,
                ),
                _passwordField(),
                SizedBox(
                  height: 60,
                ),
                _loginButton(),
                SizedBox(
                  height: 10,
                ),
                _createAccount(context),
              ],
            ),

        ),
      ),
    );
  }

  Widget _primaryText() {
    return const Text(
      "Bienvenue !",
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
      "Veuillez vous connecter ou créer un nouveau compte pour utiliser l'application",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 20,
        fontFamily: 'GoogleSans',
        color: Colors.white,
      ),
    );
  }

  Widget _emailField() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
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
                "Email",
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
          validator: (value) => state.isEmailValid ? null : 'Email incorrect',
          onChanged: (value) => context.read<LoginBloc>().add(
                LoginEmailChanged(email: value),
              ));
    });
  }

  Widget _passwordField() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return TextFormField(
          // controller: password,
          textAlignVertical: TextAlignVertical.center,
          keyboardType: TextInputType.visiblePassword,
          obscureText: !_obscureText,
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
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility : Icons.visibility_off,
                color: Theme.of(context).primaryColorLight,
              ),
              onPressed: () {
                _showPassword();
              },
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          ),
          validator: (value) =>
              state.isPasswordValid ? null : 'Mot de passe incorrect',
          onChanged: (value) => context.read<LoginBloc>().add(
                LoginPasswordChanged(password: value),
              ));
    });
  }

  Widget _loginButton() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return state.formStatus is FormSubmitting
          ? const CircularProgressIndicator()
          : InkWell(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  context.read<LoginBloc>().add(LoginSubmitted());
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

  Widget _createAccount(BuildContext context) {
    return InkWell(
      onTap: () => context.read<AuthCubit>().showSignup(),
      hoverColor: Colors.indigo,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: Colors.indigo,
              width: 2,
            )),
        child: const Center(
          child: Text(
            "Créer un nouveau compte",
            style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontFamily: 'GoogleSans',
                fontWeight: FontWeight.normal),
          ),
        ),
      ),
    );
  }

  Widget _forgotPassword() {
    return InkWell(
      onTap: () => context.read<AuthCubit>().showForgotPassword() ,

        child: const Padding(
          padding: EdgeInsets.only(bottom: 5),
          child: Text(
            "Mot de passe oublié",
            style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontFamily: 'GoogleSans',
                fontWeight: FontWeight.normal),
          ),
        ),
      );

  }

  void _showError(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
/*
  // Create a boolean for checking the sign in status
  bool isSignedIn = false;

  Future<void> signInUser(String username, String password) async {
    try {
      final result = await Amplify.Auth.signIn(
        username: username,
        password: password,
      );

      setState(() {
        isSignedIn = res.isSignedIn;
      });
    } on AuthException catch (e) {
      safePrint(e.message);
    }
  }*/
}
