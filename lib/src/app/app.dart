import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:todo/src/ui/route/app_route.dart';

class App extends HookWidget {
  App({required this.flavor});
  final flavor;
  @override
  Widget build(BuildContext context) {
    final AppRouter appRouter = useMemoized(() => AppRouter());
    return MaterialApp.router(
      debugShowCheckedModeBanner: (flavor == 'development'),
      routeInformationParser: appRouter.defaultRouteParser(),
      routerDelegate: appRouter.delegate(),
    );
  }
}
