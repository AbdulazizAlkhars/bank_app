import 'package:bank_app/models/trans.dart';
import 'package:bank_app/providers/authprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransTile extends StatelessWidget {
  final Trans transaction;
  const TransTile({Key? key, required this.transaction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return transaction.amount != 0
        ? Card(
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
                            : transaction.type == "deposit"
                                ? Image.asset('assets/images/deposit.png')
                                : Image.asset('assets/images/banklogo.png')),
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
                      : transaction.type == "deposit"
                          ? Text(
                              '${transaction.amount}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Color.fromRGBO(76, 175, 80, 1)),
                            )
                          : Text(
                              '${transaction.amount}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Color.fromARGB(246, 9, 111, 237)),
                            ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Column(
                      children: [
                        Text(
                          "Operation Type",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),
                        ),
                        Text("${transaction.type.toString().toUpperCase()}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            )),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        : Card(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("No Transactions")]),
          );
  }
}

// if(transaction.type == "withdraw"){
// Image.asset('assets/images/withdrawal.png');
//                   }else if(transaction.type == "deposit"){
// Image.asset(
//                           'assets/images/deposit.png');
//                   }else{
// Image.asset(
//                           'assets/images/deposit.png');
//                   }