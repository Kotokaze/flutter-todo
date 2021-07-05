import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simple_logger/simple_logger.dart';
import 'package:todo/src/data/provider/logger_provider.dart';
import 'package:todo/src/ui/model/loading_state_view_model.dart';
import 'package:todo/src/ui/model/user_view_model.dart';

class SignInPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final SimpleLogger logger = context.read(loggerProvider);
    final UserViewModel userViewModel = context.read(userViewModelProvider);
    final LoadingStateViewModel loadingStateViewModel = context.read(loadingStateViewModelProvider);

    logger.info("SIGNIN PAGE");

    return Scaffold(
      appBar: AppBar(title: Text("SignIn Page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SignInButton(Buttons.GoogleDark,
              onPressed: () => loadingStateViewModel
                  .whileLoading(() => userViewModel.handleSignInWithGoogle()
                      .then((_) {
                        if (userViewModel.isAuthenticated){
                          logger.info("Signed in as ${userViewModel.user!.uid}");
                          context.router.replaceNamed('/home');
                        }
                        else
                          logger.info("Failed");
                      })),
            ),
          ]
        )
      )
    );
  }
}
