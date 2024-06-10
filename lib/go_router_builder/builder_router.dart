import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wabiz_go_router/main.dart';

part 'builder_router.g.dart';

@TypedGoRoute<HomeRoute>(
  path: '/',
  routes: <TypedGoRoute<GoRouteData>>[
    TypedGoRoute<UserRoute>(path: 'user/:userId')
  ],
)
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return HomeScreen();
  }
}

@TypedGoRoute<LoginRoute>(
  path: '/login',
)
class LoginRoute extends GoRouteData {
  LoginRoute(this.from);

  final String? from;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return LoginScreen();
  }
}

class UserRoute extends GoRouteData {
  const UserRoute(this.userId);

  final String userId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return UserScreen(
      userId: userId,
    );
  }
}
