import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo/src/ui/model/user_view_model.dart';

class HomePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final UserViewModel userViewModel = context.read(userViewModelProvider);

    return Scaffold(
      body: Center(child: Text("Hello ${userViewModel.user!.name}"))
    );
  }
}
