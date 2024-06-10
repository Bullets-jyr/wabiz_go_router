import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final _router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => HomeScreen(),
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Home Screen 입니다.'),
            TextButton(
              onPressed: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (BuildContext context) {
                //       return LoginScreen();
                //     },
                //   ),
                // );

                // GoRouter.of(context).go('/login');

                // context.go('/login');

                context.push('/login');
              },
              child: Text(
                '로그인 페이지 이동',
              ),
            ),
            TextButton(
              onPressed: () {
                context.push('/user');
              },
              child: Text(
                '사용자 페이지로 이동',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Screen"),
      ),
      body: Center(
        child: Text("Login 화면"),
      ),
    );
  }
}

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Screen"),
      ),
      body: Center(
        child: Text("User 1"),
      ),
    );
  }
}
