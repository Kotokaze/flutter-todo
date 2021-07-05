import 'package:auto_route/auto_route.dart';
import 'package:todo/src/ui/page/home_page.dart';
import 'package:todo/src/ui/page/sign_in_page.dart';

export 'app_route.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/home',
      page: HomePage,
      // children: <AutoRoute>[
      //   AutoRoute(
      //     path: '',
      //     page: ,
      //   ),
      // ],
    ),
    AutoRoute(
      path: '/signin',
      page: SignInPage,
      fullscreenDialog: true,
      initial: true,
    ),
  ],
)
class $AppRouter {}
