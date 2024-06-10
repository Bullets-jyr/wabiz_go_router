import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wabiz_go_router/go_router_builder/builder_router.dart';

import 'go_router_basic/basic.dart';
import 'shell_router/my_shell_router.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final _router = GoRouter(routes: $appRoutes);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: shellRouter,
    );
  }
}

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Home Screen"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Home Screen 입니다.'),
//             TextButton(
//               onPressed: () {
//                 // Navigator.of(context).push(
//                 //   MaterialPageRoute(
//                 //     builder: (BuildContext context) {
//                 //       return LoginScreen();
//                 //     },
//                 //   ),
//                 // );
//
//                 // GoRouter.of(context).go('/login');
//
//                 // context.go('/login');
//
//                 // context.push('/login');
//
//                 LoginRoute('').go(context);
//               },
//               child: Text(
//                 '로그인 페이지 이동',
//               ),
//             ),
//             TextButton(
//               onPressed: () {
//                 // context.push('/user');
//                 const UserRoute('10').push(context);
//               },
//               child: Text(
//                 '사용자 페이지로 이동',
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.child});

  final Widget? child;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: (index) {
          if (index == 0) {
            GoRouter.of(context).go('/login');
          } else {
            GoRouter.of(context).go('/user');
          }
          setState(() {
            pageIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.login,
            ),
            label: '로그인',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle_outlined,
            ),
            label: '프로필',
          ),
        ],
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text("Login 화면"),
    );
  }
}

class UserScreen extends StatelessWidget {
  UserScreen({
    super.key,
    this.userId,
  });

  final String? userId;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("User Screen"),
        Center(
          child: Text("User $userId"),
        ),
      ],
    );
  }
}
