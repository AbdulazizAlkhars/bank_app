import 'package:bank_app/pages/main_page.dart';
import 'package:bank_app/pages/profilepage.dart';
import 'package:bank_app/providers/authprovider.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'all_transactions.dart';

class SecondMain extends StatefulWidget {
  SecondMain({Key? key}) : super(key: key);

  @override
  State<SecondMain> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<SecondMain> {
  int index = 0;
  final screens = [
    NavHomePage(),
    Transactions(),
    EditProfilePage(),
    // profile
  ];
  @override
  Widget build(BuildContext context) {
    //  var formatter = NumberFormat('###,###,000');
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 241, 240, 240),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(246, 9, 111, 237),
          actions: [
            IconButton(
                onPressed: () {
                  context.read<UserProvider>().logout();
                  context.push("/");
                },
                icon: Icon(
                  Icons.logout_outlined,
                  color: Colors.white,
                ))
          ],
          title: Image.asset(
            "assets/images/logo_bank_white.png",
            height: 60,
            width: 200,
          ),
          // title: Text("Welcome ${context.read<UserProvider>().user!.username}"),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15),
            ),
          ),
          elevation: 12.5,
        ),
        bottomNavigationBar: NavigationBarTheme(
          // selectedItemColor : colors.white,
          // unselectedItemColor : colors.white,

          data: NavigationBarThemeData(
              indicatorColor: Colors.transparent,
              labelTextStyle: MaterialStateProperty.all(
                  TextStyle(fontSize: 14, fontWeight: FontWeight.w500))),
          child: NavigationBar(
              height: 50,
              backgroundColor: Colors.white,
              labelBehavior:
                  NavigationDestinationLabelBehavior.onlyShowSelected,
              selectedIndex: index,
              animationDuration: Duration(seconds: 1),
              onDestinationSelected: (index) =>
                  setState(() => this.index = index),
              destinations: [
                NavigationDestination(
                    icon: Icon(Icons.home_outlined),
                    selectedIcon: Icon(Icons.home_filled),
                    label: "Home"),
                NavigationDestination(
                    icon: Icon(Icons.swap_horiz_rounded),
                    selectedIcon: Icon(Icons.swap_horizontal_circle),
                    label: "Transactions"),
                context.read<UserProvider>().user!.image != null
                    ? NavigationDestination(
                        icon: CircleAvatar(
                            radius: 15,
                            backgroundImage: NetworkImage(
                                '${context.read<UserProvider>().user!.image}')),
                        selectedIcon: CircleAvatar(
                            radius: 15,
                            backgroundImage: NetworkImage(
                                '${context.read<UserProvider>().user!.image}')),
                        label: "Profile")
                    : NavigationDestination(
                        icon: Icon(Icons.account_circle_outlined),
                        selectedIcon: Icon(Icons.account_circle_rounded),
                        label: "Profile")
              ]),
        ),
        // backgroundColor: Colors.transparent,

        body: IndexedStack(index: index, children: screens));
  }
}
