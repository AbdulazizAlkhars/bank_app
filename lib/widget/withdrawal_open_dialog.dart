import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

Future<void> showCashDialog(BuildContext context,
    {required String title,
    required void Function(int) onSubmit,
    required String buttonText}) {
  return showDialog(
      context: context,
      builder: (context) => WithdrawalOpenDialog(
            title: title,
            onSubmit: onSubmit,
            buttonText: buttonText,
          ));
}

class WithdrawalOpenDialog extends StatefulWidget {
  final String title;
  final String buttonText;

  final void Function(int) onSubmit;
  WithdrawalOpenDialog(
      {Key? key,
      required this.title,
      required this.onSubmit,
      required this.buttonText})
      : super(key: key);

  @override
  State<WithdrawalOpenDialog> createState() => _WithdrawalOpenDialogState();
}

class _WithdrawalOpenDialogState extends State<WithdrawalOpenDialog> {
  late TextEditingController _controller;
  bool isButtonActive = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.addListener(() {
      final isButtonActive = _controller.text.isNotEmpty;
      setState(() => this.isButtonActive = isButtonActive);
    });
  }

  @override
  void dispose() {
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
        content: TextField(
          controller: _controller,
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
                          widget.onSubmit(int.parse(_controller.text));
                          _controller.clear();
                          Navigator.pop(context);
                          print("WITHDRAWEL DIALOG");
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
