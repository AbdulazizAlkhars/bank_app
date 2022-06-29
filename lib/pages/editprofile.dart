import 'package:bank_app/main.dart';
import 'package:bank_app/providers/authprovider.dart';
import 'package:bank_app/widget/deposit_open_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    var u = context.read<UserProvider>().user;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Welcome ${context.read<UserProvider>().user!.username}"),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(5),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 115, 112, 112),
        elevation: 0,
        // leading: Container(
        //   width: 55,
        //   child: Row(
        //     children: [Align(), Icon(Icons.account_circle_outlined)],
        //   ),
        // ),
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            indicatorColor: Colors.blue.shade100,
            labelTextStyle: MaterialStateProperty.all(
                TextStyle(fontSize: 14, fontWeight: FontWeight.w500))),
        child: NavigationBar(
            height: 50,
            backgroundColor: Colors.white,
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
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
                  icon: Icon(Icons.account_balance_wallet_outlined),
                  selectedIcon: Icon(Icons.account_balance_wallet),
                  label: "Account"),
              InkWell(
                onTap: () {
                  context.push("/transfer");
                },
                child: NavigationDestination(
                    icon: Icon(Icons.swap_horiz_rounded),
                    selectedIcon: Icon(Icons.swap_horizontal_circle),
                    label: "transfer"),
              ),
              NavigationDestination(
                  icon: Icon(Icons.account_circle_outlined),
                  selectedIcon: Icon(Icons.account_circle_rounded),
                  label: "Profile")
            ]),
      ),
      // backgroundColor: Colors.transparent,
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Container(
            height: 150,
            width: 170,
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Main account"),
                  Text("Balance in KD"),
                  Row(
                    children: [Text("account Number"), Text("data")],
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 150,
            width: 170,
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Saving Account"),
                  Text("1000 KD"),
                  Row(
                    children: [Text("account Number"), Text("data")],
                  ),
                ],
              ),
            ),
          ),
        ]),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    child: Icon(Icons.add_circle_outline,
                        size: 24, color: Colors.blueAccent),
                    padding: const EdgeInsets.all(12),
                  ),
                  InkWell(
                    onTap: () {
                      showCashDialog(context, title: "Deposit",
                          onSubmit: (value) {
                        print(value);
                        context.read<UserProvider>().addDeposit(value);

                        print("Hello");
                      }, buttonText: "Deposit");
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(12),
                              bottomLeft: Radius.circular(12))),
                      child: Text(
                        "Deposit",
                        softWrap: true,
                      ),
                      padding: const EdgeInsets.all(12),
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    child: Icon(Icons.remove_circle_outline_rounded,
                        size: 24, color: Colors.blueAccent),
                    padding: const EdgeInsets.all(12),
                  ),
                  InkWell(
                    onTap: () {
                      context.push("/withdrawal");
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(12),
                              bottomLeft: Radius.circular(12))),
                      child: Text(
                        "Withdrawal",
                        softWrap: true,
                      ),
                      padding: const EdgeInsets.all(12),
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    child: Icon(
                        Icons.
                            // list
                            library_books_outlined,
                        size: 24,
                        color: Colors.blueAccent),
                    padding: const EdgeInsets.all(12),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(12),
                              bottomLeft: Radius.circular(12))),
                      child: Text(
                        "Transaction",
                        softWrap: true,
                      ),
                      padding: const EdgeInsets.all(12),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        Container(
          height: 250,
          child: Column(
            children: [
              Container(height: 50, child: Text("My Transactions")),

              Card(
                // 2
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: SizedBox(
                          width: 60,
                          height: 60,
                          child: ClipOval(
                            child: Image.asset(
                              'assets/images/banklogo.png',
                            ),
                          )),
                    ),
                    // Container(
                    //   padding: EdgeInsets.all(10),
                    //   child: Image.asset(
                    //     'assets/images/banklogo.png',
                    //     width: 125,
                    //     height: 125,
                    //   ),
                    // ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        'details',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                          child: Align(
                        alignment: Alignment.centerRight,
                        child: Text("total amount "),
                      )),
                    )
                  ],
                ),
              ),
              // ListView.builder(
              //     itemCount: 1,
              //     itemBuilder: (BuildContext context, int index) {
              //       return Card(
              //         child: Row(
              //           children: [
              //             // Expanded(
              //             // child:
              //             Container(
              //               padding: EdgeInsets.all(20),
              //               child: Text(
              //                 "transaction",
              //                 style: TextStyle(
              //                   fontWeight: FontWeight.bold,
              //                   fontSize: 18,
              //                 ),
              //               ),
              //             ),
              //             // ),
              //             Container(
              //               padding: EdgeInsets.all(10),
              //               child: Image.asset(
              //                 'assets/images/am-realty.jpeg',
              //                 width: 125,
              //                 height: 125,
              //               ),
              //             ),
              //           ],
              //         ),
              //       );
              //       // Card(child: Text("data"));
              //     }
              // ),
            ],
          ),
        ),
      ]),
    );
  }
}
