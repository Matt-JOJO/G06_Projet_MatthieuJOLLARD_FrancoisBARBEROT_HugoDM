import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter/material.dart';

import '../amplifyconfiguration.dart';

class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  // final _signUpField

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
                "Inscription",
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
                "Veuillez saisir ces différentes informations, afin que vos listes soient sauvegardées.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'GoogleSans',
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 50,
              ),

              ///Name input///
              TextFormField(
                textAlignVertical: TextAlignVertical.center,
                keyboardType: TextInputType.name,
                style: const TextStyle(
                  color: Colors.white,
                ),
                // controller: field,
                decoration: InputDecoration(
                  fillColor: Color(0xFF1E262C),
                  filled: true,
                  label: const Center(
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
              ),
              SizedBox(
                height: 7,
              ),
              ///Email input///
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
                height: 7,
              ),

              ///Field for password #1///
              TextFormField(
                // controller: password,
                textAlignVertical: TextAlignVertical.center,
                keyboardType: TextInputType.visiblePassword,

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
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
              SizedBox(
                height: 7,
              ),
              ///Field for password #2///
              TextFormField(
                // controller: password,
                textAlignVertical: TextAlignVertical.center,
                keyboardType: TextInputType.visiblePassword,

                style: TextStyle(
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
                      "S'inscrire",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: 'GoogleSans',
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}

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
