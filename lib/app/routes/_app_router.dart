import 'package:auto_route/auto_route.dart';

import '../middlewares/middlewares.export.dart';
import '_app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes {
    return [
      AutoRoute(
        path: '/auth',
        page: AuthGroupRoute.page,
        children: [
          RedirectRoute(path: '', redirectTo: 'sign-in'),
          AutoRoute(path: 'sign-in', page: SignInRoute.page),
          AutoRoute(path: 'sign-up', page: SignUpRoute.page),
        ],
      ),
      AutoRoute(
        path: '/client',
        page: ClientGroupRoute.page,
        initial: true,
        guards: [AuthMiddleware()],
        children: [
          RedirectRoute(path: '', redirectTo: 'bottom-nav'),
          AutoRoute(path: 'bottom-nav', page: BottomNavRoute.page),
        ],
      ),
    ];
  }
}
