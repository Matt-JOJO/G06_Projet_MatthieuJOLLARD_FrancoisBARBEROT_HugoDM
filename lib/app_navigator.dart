import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter/material.dart';

import 'amplifyconfiguration.dart';

class AppNavigator extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Navigator(
      pages: [],
      onPopPage: (route, result)=> route.didPop(result),
    );
  }
}


