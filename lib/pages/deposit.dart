import 'package:bank_app/services/authservices.dart';
import 'package:bank_app/widget/textfield.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:provider/provider.dart';

import '../providers/authprovider.dart';

class Deposit extends StatelessWidget {
  const Deposit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var deposit = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(53, 66, 89, 10),
        title: const Text("Deposit"),
      ),
      body: Column(children: [
        TextField(
          controller: deposit,
          // style: const TextStyle(fontSize: 12),
          decoration: InputDecoration(
            suffixIcon: IconButton(
                icon: Icon(Icons.send),
                onPressed: () {
                  // context
                  //     .read<UserProvider>()
                  //     .addDeposit(int.parse(deposit.text));
                  context.read<AuthServices>().getTransactionsService();
                  print(context.read<UserProvider>().user?.balance);
                }),
            hintText: "Enter The Amount in KD",
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                  width: 1, color: Color.fromRGBO(236, 229, 199, 10)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                  width: 1, color: Color.fromRGBO(236, 229, 199, 10)),
            ),
          ),
        ),
        // Text(AuthServices().getTransactionsService().toString())

        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: TextField(
        //     controller: deposit,
        //     // style: const TextStyle(fontSize: 12),
        //     decoration: InputDecoration(
        //       suffixIcon: IconButton(icon: Icon(Icons.send), onPressed: () {}),
        //       hintText: 'Add Amount in KD',
        //       focusedBorder: OutlineInputBorder(
        //         borderRadius: BorderRadius.circular(10),
        //         borderSide: const BorderSide(
        //             width: 1, color: Color.fromRGBO(236, 229, 199, 10)),
        //       ),
        //       enabledBorder: OutlineInputBorder(
        //         borderRadius: BorderRadius.circular(10),
        //         borderSide: const BorderSide(
        //             width: 1, color: Color.fromRGBO(236, 229, 199, 10)),
        //       ),
        //     ),
        //   ),
        // ),
      ]),
    );
  }
}
