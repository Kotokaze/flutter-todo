import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simple_logger/simple_logger.dart';
import 'package:todo/src/data/provider/logger_provider.dart';
import 'package:todo/src/ui/model/loading_state_view_model.dart';
import 'package:todo/src/ui/model/user_view_model.dart';

class HomePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final SimpleLogger logger = context.read(loggerProvider);
    final UserViewModel userViewModel = context.read(userViewModelProvider);
    final LoadingStateViewModel loadingStateViewModel = context.read(loadingStateViewModelProvider);

    logger.info("HOME PAGE");

    return Scaffold(
      appBar: AppBar(
      title: Text("Home Page"),
      actions: [
      IconButton(
        tooltip: "Sign Out",
        icon: Icon(Icons.logout),
        onPressed: () => loadingStateViewModel
          .whileLoading(() async
            => await userViewModel.handleSignOut().then((_)
                => context.router.replaceNamed('/signin'))
          )
        )
      ],
    ),
    body: Center(child: Text("Hello ${userViewModel.user!.name}"))
    );
  }
}
