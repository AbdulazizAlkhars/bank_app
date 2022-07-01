import 'dart:io';

import 'package:bank_app/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';
import '../providers/authprovider.dart';

class SignUpForm extends StatefulWidget {
  @override
  SignUpFormState createState() {
    return SignUpFormState();
  }
}

class SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String username = "";
  String password = "";
  String repassword = "";
  File? _image;

  final _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () async {
                  showModalBottomSheet(
                      context: context,
                      builder: ((builder) => Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: Column(
                            children: <Widget>[
                              Text(
                                "Choose Profile Photo",
                                style: TextStyle(fontSize: 20),
                              ),
                              SizedBox(
                                height: 30,
                                width: 100,
                              ),
                              ElevatedButton.icon(
                                icon: Icon(Icons.camera),
                                onPressed: () async {
                                  final XFile? image = await _picker.pickImage(
                                      source: ImageSource.camera);
                                  setState(() {
                                    _image = File(image!.path);
                                  });
                                },
                                label: Text("From Camera"),
                              ),
                              ElevatedButton.icon(
                                icon: Icon(Icons.image),
                                onPressed: () async {
                                  final XFile? image = await _picker.pickImage(
                                      source: ImageSource.gallery);
                                  setState(() {
                                    _image = File(image!.path);
                                  });
                                },
                                label: Text("From Gallary"),
                              ),
                              ElevatedButton.icon(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  setState(() {
                                    _image = null;
                                  });
                                },
                                label: Text("Remove Image"),
                              )
                            ],
                          ))));
                },
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 70,
                  child: _image != null
                      ? ClipOval(
                          child: Image.file(
                            _image!,
                            fit: BoxFit.cover,
                            width: 160,
                            height: 160,
                          ),
                        )
                      : Center(
                          child: CircleAvatar(
                            radius: 100.0,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 19.0,
                                  child: Icon(
                                    Icons.camera_alt,
                                    size: 20.0,
                                    color: Color(0xFF404040),
                                  ),
                                ),
                              ),
                              radius: 100.0,
                              backgroundColor: Colors.white,
                              backgroundImage:
                                  AssetImage('assets/images/image-default.png'),
                            ),
                          ),

                          // Icon(
                          //   Icons.account_circle_rounded,
                          //   color: Color.fromARGB(255, 141, 141, 141),
                          //   size: 140,
                          // ),
                        ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(25.0),
                child: Text(
                  "Choose Profile Image",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 35, 25, 6),
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Add Username',
                prefixIcon: Icon(Icons.login),
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
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter username";
                } else {
                  return null;
                }
              },
              onSaved: (value) {
                username = value!;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 6, 25, 15),
            child: TextFormField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Add Password',
                  prefixIcon: Icon(Icons.lock_outline),
                  // suffixIcon: Icon(Icons.visibility),
                  suffixIcon: Icon(Icons.visibility_off),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.5),
                    borderSide: BorderSide(
                        width: 1, color: Color.fromRGBO(236, 229, 199, 10)),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.5),
                      borderSide: BorderSide(
                          width: 1, color: Color.fromRGBO(236, 229, 199, 10)))),
              maxLines: null,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter a password";
                } else {
                  return null;
                }
              },
              onSaved: (value) {
                password = value!;
              },
              // obscureText: true,
              // lets make it unvisable
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 6, 25, 25),
              child: SizedBox(
                width: 340,
                height: 49,
                child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        var didSignUp = await context
                            .read<UserProvider>()
                            .signup(User(
                                username: username,
                                password: password,
                                image: _image?.path));
                        context.go("/profile");
                      } else {
                        print("error");
                      }
                    },
                    child: Text("Sign Up"),
                    style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(fontSize: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.5),
                        ),
                        primary: Color.fromARGB(246, 9, 111, 237))),
              ),
            ),
          )
        ],
      ),
    );
    // ignore: dead_code
  }
}
