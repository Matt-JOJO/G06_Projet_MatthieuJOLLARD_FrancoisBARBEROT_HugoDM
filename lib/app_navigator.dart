import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysteamapp/auth/auth_cubit.dart';
import 'package:mysteamapp/auth/auth_navigator.dart';
import 'package:mysteamapp/session_cubit.dart';
import 'package:mysteamapp/session_state.dart';
import 'package:mysteamapp/views/session_view.dart';
import 'package:mysteamapp/views/waiting_view.dart';

/// this is allows to pass from the authentication flow to the session flow

class AppNavigator extends StatelessWidget {
  const AppNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SessionCubit, SessionState>(builder: (context, state) {
      return Navigator(
        pages: [
          // show waiting screen
          if (state is UnknownSessionState) MaterialPage(child: WaitingView()),

          // show connexion flow
          if (state is Unauthenticated)
            MaterialPage(
              child: BlocProvider(
                create: (context) =>
                    AuthCubit(sessionCubit: context.read<SessionCubit>()),
                child: const AuthNavigator(),
              ),
            ),

          // show session flow
          if (state is Authenticated) MaterialPage(child: SessionView()),
        ],
        onPopPage: (route, result) => route.didPop(result),
      );
    });
  }
}
