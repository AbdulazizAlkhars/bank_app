import 'package:bank_app/pages/editprofile.dart';
import 'package:bank_app/pages/homepage.dart';
import 'package:bank_app/pages/signup.dart';
import 'package:bank_app/providers/authprovider.dart';
import 'package:bank_app/providers/trans_provider.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'pages/transfer.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
    ChangeNotifierProvider<TransProvider>(create: (_) => TransProvider()),
  ], child: MyApp()));
}

final _router = GoRouter(routes: [
  GoRoute(path: "/", builder: (context, state) => HomePage()),
  GoRoute(path: "/signup", builder: (context, state) => SignUp()),
  GoRoute(path: "/profile", builder: (context, state) => ProfilePage()),
  GoRoute(path: "/transfer", builder: (context, state) => Transfer()),
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
