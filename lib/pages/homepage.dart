import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';
import '../providers/authprovider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var username = TextEditingController();
    var password = TextEditingController();

    return Scaffold(
      // backgroundColor: Colors.transparent,
      body: Column(children: [
        Image(
            width: 150,
            height: 200,
            image: AssetImage("assets/images/banklogo.png")),
        Text("Welcome,"),
        Text("Have a nice day!"),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: username,
            // style: const TextStyle(fontSize: 12),
            decoration: InputDecoration(
              hintText: 'Enter Your User Name',
              prefixIcon: Icon(Icons.login),
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
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
              controller: password,
              // style: const TextStyle(fontSize: 12),
              decoration: InputDecoration(
                  hintText: 'Enter Your Password',
                  prefixIcon: Icon(Icons.password),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        width: 1, color: Color.fromRGBO(236, 229, 199, 10)),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          width: 1,
                          color: Color.fromRGBO(236, 229, 199, 10))))),
        ),
        ElevatedButton(
            onPressed: () async {
              await context.read<UserProvider>().signin(
                  User(username: username.text, password: password.text));

              if (context.read<UserProvider>().isAuth == true) {
                context.go("/profile");
              } else {
                print("Error");
              }
            },
            child: Text("LOG IN"),
            style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(205, 194, 174, 10))),
        Text("Forget Password"),
        Text("Don't Have an Account?"),
        GestureDetector(
          onTap: () {
            context.push("/signup");
          },
          child: Text("Create an Account"),
        ),
      ]),
    );
  }
}
