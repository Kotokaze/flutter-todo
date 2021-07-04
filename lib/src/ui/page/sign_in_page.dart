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
    final SimpleLogger _logger = context.read(loggerProvider);
    final UserViewModel _userViewModel = context.read(userViewModelProvider);
    final LoadingStateViewModel _loading = context.read(loadingStateViewModelProvider);

    return Scaffold(
      appBar: AppBar(title: Text("SignIn Page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SignInButton(Buttons.GoogleDark,
              onPressed: () => _loading
                  .whileLoading(() => _userViewModel.handleSignInWithGoogle()
                      .then((_) {
                        if (_userViewModel.isAuthenticated){
                          _logger.info("Signed in as ${_userViewModel.user!.uid}");
                          context.router.replaceNamed('/home');
                        }
                        else
                          _logger.info("Failed");
                      })),
            ),
          ]
        )
      )
    );
  }
}
