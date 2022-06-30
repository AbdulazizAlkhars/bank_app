import 'package:bank_app/models/trans.dart';
import 'package:bank_app/providers/trans_provider.dart';
import 'package:bank_app/widget/transactions_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Transactions extends StatelessWidget {
  const Transactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Container(height: 50),
        Expanded(
          child: FutureBuilder(
              future: context.read<TransProvider>().getTransProviders(),
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text("Network Error");
                } else {
                  List<Trans> profileTrans =
                      Provider.of<TransProvider>(context, listen: true).trans;
                  return ListView.builder(
                      itemCount: profileTrans.length,
                      itemBuilder: (BuildContext context, int index) {
                        return TransTile(transaction: profileTrans[index]);
                      });
                }
              })),
        )
      ]),
    );
  }
}
