import 'package:bank_app/models/trans.dart';
import 'package:bank_app/providers/authprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransTile extends StatelessWidget {
  final Trans transaction;
  const TransTile({Key? key, required this.transaction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.transparent,
            child: SizedBox(
              width: 60,
              height: 60,
              child: ClipOval(
                  child: transaction.type == "withdraw"
                      ? Image.asset('assets/images/withdrawal.png')
                      : Image.asset(
                          'assets/images/deposit.png',
                        )),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: transaction.type == "withdraw"
                ? Text(
                    '${transaction.amount}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.red),
                  )
                : Text(
                    '${transaction.amount}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.green),
                  ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Column(
                children: [
                  Text("${context.read<UserProvider>().user?.balance}KWD",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      )),
                  Text(
                    "New Balance",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 8,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
