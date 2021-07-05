import 'package:auto_route/auto_route.dart';
import 'package:todo/src/ui/page/home_page.dart';

export 'app_route.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      page: HomePage,
      initial: true,
      // children: <AutoRoute>[
      //   AutoRoute(
      //     path: 'top',
      //     page: HomePage,
      //   ),
      // ],
    ),
  ],
)
class $AppRouter {}
