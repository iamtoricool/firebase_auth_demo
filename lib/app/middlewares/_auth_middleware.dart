import 'package:auto_route/auto_route.dart';

class AuthMiddleware extends AutoRouteGuard {
  @override
  void onNavigation(resolver, router) {
    return resolver.next();
  }
}
