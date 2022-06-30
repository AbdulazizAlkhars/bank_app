import 'package:bank_app/models/trans.dart';
import 'package:bank_app/providers/authprovider.dart';
import 'package:bank_app/widget/deposit_open_dialog.dart';
import 'package:bank_app/widget/transfer_dialog.dart';
import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../providers/trans_provider.dart';
import '../widget/transactions_list.dart';

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
      appBar: AppBar(
        title: Text("Welcome ${context.read<UserProvider>().user!.username}"),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(5),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 115, 112, 112),
        elevation: 0,
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 150,
            width: 170,
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Countup(
                      begin: 0,
                      end: context
                          .watch<UserProvider>()
                          .user!
                          .balance!
                          .toDouble())
                  // Text("Main account"),
                  // Text(
                  //     "Balance ${context.watch<UserProvider>().user?.balance} in KD"),
                ],
              ),
            ),
          ),
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
                        showCashDialog(context, title: "DEPOSIT",
                            onSubmit: (value) {
                          print(value);
                          context.read<UserProvider>().addDeposit(value);

                          print("Hello");
                        }, buttonText: "DEPOSIT");
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(12),
                                bottomLeft: Radius.circular(12))),
                        child: Text(
                          "DEPOSIT",
                          softWrap: true,
                          style: TextStyle(fontWeight: FontWeight.bold),
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
                        showCashDialog(context, title: "WITHDRAWAL",
                            onSubmit: (value) {
                          print(value);
                          context.read<UserProvider>().withDrawal(value);

                          print("Hello");
                        }, buttonText: "WITHDRAWAL");
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(12),
                                bottomLeft: Radius.circular(12))),
                        child: Text(
                          "WITHDRAWAL",
                          softWrap: true,
                          style: TextStyle(fontWeight: FontWeight.bold),
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
                      child: Icon(Icons.library_books_outlined,
                          size: 24, color: Colors.blueAccent),
                      padding: const EdgeInsets.all(12),
                    ),
                    InkWell(
                      onTap: () {
                        transCashDialog(context, title: "TRANSFER",
                            onSubmit: (value, username) {
                          print(username);
                          context
                              .read<UserProvider>()
                              .transferProvider(value, username);

                          print("Hello");
                        }, buttonText: "TRANSFER");
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(12),
                                bottomLeft: Radius.circular(12))),
                        child: Text(
                          "TRANSFER",
                          softWrap: true,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        padding: const EdgeInsets.all(12),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(height: 50, child: Text("My Transactions")),
                Expanded(
                  child: FutureBuilder(
                      future: context.read<TransProvider>().getTransProviders(),
                      builder: ((context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Text("Network Error");
                        } else {
                          List<Trans> profileTrans =
                              Provider.of<TransProvider>(context, listen: true)
                                  .trans;
                          return ListView.builder(
                              itemCount: 3,
                              itemBuilder: (BuildContext context, int index) {
                                return TransTile(
                                    transaction: profileTrans[index]);
                              });
                        }
                      })),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
