import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class Withdrawal extends StatefulWidget {
  const Withdrawal({Key? key}) : super(key: key);

  @override
  State<Withdrawal> createState() => _WithdrawalState();
}

class _WithdrawalState extends State<Withdrawal> {
  bool isButtonActive = true;
  late TextEditingController amountController;
  @override
  void initState() {
    super.initState();
    amountController = TextEditingController();
    amountController.addListener(() {
      final isButtonActive = amountController.text.isNotEmpty;
      setState(() => this.isButtonActive = isButtonActive);
    });
  }

  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Withdrawal")),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              margin: EdgeInsets.only(
                left: 100,
              ),
              child: TextField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: InputDecoration(
                  // floatingLabelAlignment: FloatingLabelAlignment.center,
                  labelText: "Amount",
                  hintText: "0.00",
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.attach_money),
                ),
                controller: amountController,
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(onSurface: Colors.blue),
                onPressed: isButtonActive
                    ? () {
                        setState(() => isButtonActive = false);
                        amountController.clear();
                      }
                    : null,
                child: Text("Withdrawal"))
          ],
        ));
  }
}
