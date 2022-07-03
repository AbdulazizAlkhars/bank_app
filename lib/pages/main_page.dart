import 'package:bank_app/models/trans.dart';
import 'package:bank_app/providers/authprovider.dart';
import 'package:bank_app/providers/trans_provider.dart';
import 'package:bank_app/widget/transactions_list.dart';
import 'package:bank_app/widget/transfer_dialog.dart';
import 'package:bank_app/widget/withdrawal_open_dialog.dart';
import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class NavHomePage extends StatelessWidget {
  const NavHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(10, 25, 10, 10),
            child: Text(
              "Welcome ${context.read<UserProvider>().user!.username.toUpperCase()} !",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Card(
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Text(
                      " Main Account",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 25, 10, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Countup(
                        begin: 0,
                        end: context
                            .watch<UserProvider>()
                            .user!
                            .balance!
                            .toDouble(),
                        style: TextStyle(fontSize: 30),
                      ),
                      Text(" KWD")
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 15, 10, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Available Balance"),
                    ],
                  ),
                ),
              ],
            ),
            elevation: 8,
            // shadowColor: Colors.green,
            margin: EdgeInsets.all(20),
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.white)),
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
                      padding: const EdgeInsets.all(012),
                    ),
                    InkWell(
                      onTap: () {
                        showCashDialog(context, title: "DEPOSIT",
                            onSubmit: (value) {
                          print(value);
                          context.read<UserProvider>().addDeposit(value);

                          print("DEPOSIT DIALOG");
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
                      child: Icon(Icons.autorenew_outlined,
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
                Container(
                    height: 50,
                    child: Center(
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 15, 10, 10),
                          child: Text(
                            "Latest Transactions",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          )),
                    )),
                Expanded(
                  child: FutureBuilder(
                      future: context.read<TransProvider>().getTransProviders(),
                      builder: ((context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Card(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("No Transactions",
                                      style: TextStyle(
                                        fontSize: 20,
                                      ))
                                ]),
                          );
                          
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


// 