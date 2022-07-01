import 'package:bank_app/widget/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 239, 239),
      appBar: AppBar(
          backgroundColor: Color.fromARGB(246, 9, 111, 237),
          title: Image.asset(
            "assets/images/logo_bank_white.png",
            height: 60,
            width: 200,
          )
          // const Text("Sign Up"),
          ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text(
                "Create Account",
                style: TextStyle(
                  fontSize: 25,
                  //  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Kindly Fill Out Your Informations",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            SignUpForm(),
          ],
        ),
      ),
    );
  }
}
