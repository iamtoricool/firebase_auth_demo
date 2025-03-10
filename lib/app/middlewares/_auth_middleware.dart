import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../routes/routes.export.dart';
import '../data/repositories/repositories.export.dart';

class AuthMiddleware extends AutoRouteGuard {
  @override
  void onNavigation(resolver, router) {
    final ref = ProviderScope.containerOf(resolver.context);
    final userState = ref.read(userRepoProvider);
    if (!userState.isLoggedIn) {
      resolver.redirectUntil(SignInRoute());
      // return resolver.next(false);
      return;
    }

    return resolver.next();
  }
}
