import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

Future<void> transCashDialog(BuildContext context,
    {required String title,
    required void Function(int, String) onSubmit,
    required String buttonText}) {
  return showDialog(
      context: context,
      builder: (context) => DepositOpenDialog(
            title: title,
            onSubmit: onSubmit,
            buttonText: buttonText,
          ));
}

class DepositOpenDialog extends StatefulWidget {
  final String title;
  final String buttonText;

  final void Function(int, String) onSubmit;
  DepositOpenDialog(
      {Key? key,
      required this.title,
      required this.onSubmit,
      required this.buttonText})
      : super(key: key);

  @override
  State<DepositOpenDialog> createState() => _DepositOpenDialogState();
}

class _DepositOpenDialogState extends State<DepositOpenDialog> {
  late TextEditingController _amountController;
  late TextEditingController _controller;
  bool isButtonActive = false;

  @override
  void initState() {
    super.initState();
    _amountController = TextEditingController();
    _controller = TextEditingController();
    _controller.addListener(() {
      isButtonActive =
          _amountController.text.isNotEmpty && _controller.text.isNotEmpty;
      setState(() => this.isButtonActive = isButtonActive);
    });
  }

  @override
  void dispose() {
    _amountController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text(
          widget.title,
          textAlign: TextAlign.center,
        ),
        content: Column(
          children: [
            TextField(
              controller: _controller,
              autofocus: true,
              decoration: InputDecoration(
                labelText: "Enter Username",
                hintText: "Username",
                hintStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                border: InputBorder.none,
                prefixIcon: Icon(Icons.money),
              ),
              onChanged: (v) {
                setState(() {
                  isButtonActive = _amountController.text.isNotEmpty &&
                      _controller.text.isNotEmpty;
                });
              },
            ),
            TextField(
              controller: _amountController,
              autofocus: true,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(
                labelText: "Amount In KWD",
                hintText: "0.00",
                hintStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                border: InputBorder.none,
                prefixIcon: Icon(Icons.attach_money),
              ),
              onChanged: (v) {
                setState(() {
                  isButtonActive = _amountController.text.isNotEmpty &&
                      _controller.text.isNotEmpty;
                });
              },
            ),
          ],
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(onSurface: Colors.blue),
                  onPressed: (isButtonActive)
                      ? () {
                          setState(
                            () => isButtonActive = false,
                          );
                          widget.onSubmit(int.parse(_amountController.text),
                              _controller.text);
                          _controller.clear();
                          _amountController.clear();
                          // context.pop();
                          print("Hello");
                        }
                      : null,
                  child: Text(widget.buttonText))
            ],
          ),
          // ElevatedButton(onPressed: () {}, child: Text("Cancel")),
        ],
        elevation: 2,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ));
  }
}
