// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:firebase_auth_demo/app/pages/auth/auth.export.dart' as _i1;
import 'package:firebase_auth_demo/app/pages/auth/sign_in/sign_in_view.dart'
    as _i4;
import 'package:firebase_auth_demo/app/pages/auth/sign_up/sign_up_view.dart'
    as _i5;
import 'package:firebase_auth_demo/app/pages/client/bottom_nav/bottom_nav_view.dart'
    as _i2;
import 'package:firebase_auth_demo/app/pages/client/client.export.dart' as _i3;

/// generated route for
/// [_i1.AuthGroupView]
class AuthGroupRoute extends _i6.PageRouteInfo<void> {
  const AuthGroupRoute({List<_i6.PageRouteInfo>? children})
    : super(AuthGroupRoute.name, initialChildren: children);

  static const String name = 'AuthGroupRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i1.AuthGroupView();
    },
  );
}

/// generated route for
/// [_i2.BottomNavView]
class BottomNavRoute extends _i6.PageRouteInfo<void> {
  const BottomNavRoute({List<_i6.PageRouteInfo>? children})
    : super(BottomNavRoute.name, initialChildren: children);

  static const String name = 'BottomNavRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i2.BottomNavView();
    },
  );
}

/// generated route for
/// [_i3.ClientGroupView]
class ClientGroupRoute extends _i6.PageRouteInfo<void> {
  const ClientGroupRoute({List<_i6.PageRouteInfo>? children})
    : super(ClientGroupRoute.name, initialChildren: children);

  static const String name = 'ClientGroupRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i3.ClientGroupView();
    },
  );
}

/// generated route for
/// [_i4.SignInView]
class SignInRoute extends _i6.PageRouteInfo<void> {
  const SignInRoute({List<_i6.PageRouteInfo>? children})
    : super(SignInRoute.name, initialChildren: children);

  static const String name = 'SignInRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i4.SignInView();
    },
  );
}

/// generated route for
/// [_i5.SignUpView]
class SignUpRoute extends _i6.PageRouteInfo<void> {
  const SignUpRoute({List<_i6.PageRouteInfo>? children})
    : super(SignUpRoute.name, initialChildren: children);

  static const String name = 'SignUpRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i5.SignUpView();
    },
  );
}
