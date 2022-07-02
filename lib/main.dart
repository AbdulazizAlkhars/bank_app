import 'package:bank_app/pages/all_transactions.dart';
import 'package:bank_app/pages/first_homepage.dart';
import 'package:bank_app/pages/second_main_page.dart';
import 'package:bank_app/pages/signup_page.dart';
import 'package:bank_app/providers/authprovider.dart';
import 'package:bank_app/providers/trans_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
    ChangeNotifierProvider<TransProvider>(create: (_) => TransProvider()),
  ], child: MyApp()));
}

final _router = GoRouter(routes: [
  GoRoute(path: "/", builder: (context, state) => FirstHomePage()),
  GoRoute(path: "/signup", builder: (context, state) => SignUp()),
  GoRoute(path: "/SecondMain", builder: (context, state) => SecondMain()),
  GoRoute(path: "/transactions", builder: (context, state) => Transactions()),
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
