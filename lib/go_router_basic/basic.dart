import 'package:go_router/go_router.dart';

import '../main.dart';

final routerBasic = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) {
        return HomeScreen();
      },
      routes: [
        GoRoute(
          path: "user",
          builder: (context, state) => UserScreen(),
        ),
      ],
    ),
    GoRoute(
      path: "/login",
      builder: (context, state) => LoginScreen(),
    ),
  ],
);