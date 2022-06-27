import 'package:bank_app/pages/homepage.dart';
import 'package:bank_app/pages/signup.dart';
import 'package:bank_app/providers/authprovider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      //   MultiProvider(providers: [
      ChangeNotifierProvider(
          create: ((context) => UserProvider()),
          //   ChangeNotifierProvider(create: ((context) => MemberProvider()))
          // ],

          child: MyApp()));
  // ));
}

final _router = GoRouter(routes: [
  GoRoute(path: "/", builder: (context, state) => HomePage()),
  GoRoute(path: "/signup", builder: (context, state) => SignUp()),
  // GoRoute(path: "/members", builder: (context, state) => const Members()),
  // GoRoute(path: "/add-member", builder: (context, state) => const AddMember())
]);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      routeInformationProvider: _router.routeInformationProvider,
    );
  }
}
