import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:todo/src/ui/route/app_route.dart';

class App extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final AppRouter appRouter = useMemoized(() => AppRouter());
    return MaterialApp.router(
      routeInformationParser: appRouter.defaultRouteParser(),
      routerDelegate: appRouter.delegate(),
    );
  }
}
