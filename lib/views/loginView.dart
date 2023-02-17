import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter/material.dart';

import '../amplifyconfiguration.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // final _loginField
  bool _obscureText = false;

  void _showPassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A2025),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
          child: Form(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Bienvenue !",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  fontFamily: 'GoogleSans',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Veuillez vous connecter ou créer un nouveau compte pour utiliser l'application",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'GoogleSans',
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              TextFormField(
                textAlignVertical: TextAlignVertical.center,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                  color: Colors.white,
                ),
                // controller: field,
                decoration: InputDecoration(
                  fillColor: Color(0xFF1E262C),
                  filled: true,
                  label: const Center(
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
              ),
              SizedBox(
                height: 15,
              ),

              ///Field for password///
              TextFormField(
                // controller: password,
                textAlignVertical: TextAlignVertical.center,
                keyboardType: TextInputType.visiblePassword,
                obscureText: !_obscureText,
                style: TextStyle(
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
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
              SizedBox(
                height: 80,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
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
              ),
              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {},
                hoverColor: Colors.indigo,
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Colors.indigo,
                        width: 2,
                      )),
                  child: Center(
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
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  onTap: () {},
                  child: Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 5),
                        child: Text(
                          "Mot de passe oublié",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontFamily: 'GoogleSans',
                              fontWeight: FontWeight.normal),
                        ),
                      )),
                ),
              )
            ],
          )),
        ),
      ),

    );
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
