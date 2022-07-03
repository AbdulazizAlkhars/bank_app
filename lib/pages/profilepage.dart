import 'package:bank_app/providers/authprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditProfilePage extends StatelessWidget {
  EditProfilePage({Key? key}) : super(key: key);

  bool is0bscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 241, 240, 240),
        body: Container(
            padding: EdgeInsets.only(left: 15, top: 20, right: 15),
            child: GestureDetector(
                onTap: () {
//
                  //
                },
                child: ListView(children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "Edit Profile",
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                  Center(
                      child: Stack(
                    children: [
                      Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                          border: Border.all(width: 4, color: Colors.white),
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1),
                            )
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  '${context.read<UserProvider>().user!.image}')),
                        ),
                      ),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 4,
                                  color: Colors.white,
                                ),
                                color: Colors.black.withOpacity(0.1),
                              ),
                              child: Icon(
                                Icons.edit,
                                color: Colors.black,
                              )))
                    ],
                  )),
                  SizedBox(
                    height: 30,
                    width: 30,
                  ),
                  buildTextField(
                    "Userneame",
                    "Change Username",
                    false,
                    Icon(Icons.login),
                  ),
                  buildTextField(
                    "Password",
                    "Change Password",
                    true,
                    Icon(Icons.lock_outline),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(25, 15, 25, 25),
                        child: SizedBox(
                          width: 340,
                          height: 49,
                          child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                "SAVE",
                                style: TextStyle(
                                    fontSize: 15,
                                    // letterSpacing: 2,
                                    color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                  textStyle: TextStyle(fontSize: 20),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.5),
                                  ),
                                  primary: Color.fromARGB(246, 9, 111, 237))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 25, 25),
                        child: SizedBox(
                          width: 340,
                          height: 49,
                          child: OutlinedButton(
                              onPressed: () {},
                              child: Text(
                                "Cancel",
                                style: TextStyle(
                                    fontSize: 15,
                                    // letterSpacing: 2,
                                    color: Colors.black),
                              ),
                              style: ElevatedButton.styleFrom(
                                textStyle: TextStyle(fontSize: 20),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.5),
                                ),
                                primary: Colors.grey,
                              )),
                        ),
                      ),
                    ],
                  )
                ]))));
  }

  Widget buildTextField(String labelText, String placeholder,
      bool isPasswordTextField, Widget prefixIcon) {
    return Padding(
        padding: EdgeInsets.fromLTRB(25, 15, 25, 6),
        child: TextField(
            obscureText: isPasswordTextField ? is0bscurePassword : false,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.5),
                  borderSide: const BorderSide(
                      width: 1, color: Color.fromRGBO(236, 229, 199, 10)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.5),
                  borderSide: const BorderSide(
                      width: 1, color: Color.fromRGBO(236, 229, 199, 10)),
                ),
                filled: true,
                fillColor: Colors.white,
                suffixIcon: isPasswordTextField
                    ? IconButton(
                        icon: Icon(Icons.remove_red_eye, color: Colors.grey),
                        onPressed: () {})
                    : null, // IconButton
                contentPadding: EdgeInsets.only(bottom: 5),
                labelText: labelText,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: placeholder,
                hintStyle: TextStyle(
                  color: Colors.grey,
                ))));
  }
}
