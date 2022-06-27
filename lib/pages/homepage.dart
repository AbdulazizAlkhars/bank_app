import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            // controller: addTitle,
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
              // controller: addAuthor,
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
            onPressed: () {
              // context.read<BooksProvider>().addBook(
              //     title: addTitle.text,
              //     author: addAuthor.text,
              //     genre: addGenre.text);
              // context.pop();
              print("Testing");
              // context.push("/signup");
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
