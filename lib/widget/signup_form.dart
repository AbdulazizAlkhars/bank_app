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
                              SizedBox(height: 20),
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
                  radius: 80,
                  child: _image != null
                      ? ClipOval(
                          child: Image.file(
                            _image!,
                            fit: BoxFit.cover,
                            width: 160,
                            height: 160,
                          ),
                        )
                      : Icon(
                          Icons.camera_alt,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Choose Profile Image"),
              )
            ],
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Add Username',
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
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Add Password',
            ),
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
          ),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  var didSignUp = await context.read<UserProvider>().signup(
                      User(
                          username: username,
                          password: password,
                          image: _image?.path));
                  context.go("/profile");
                } else {
                  print("error");
                }
              },
              child: const Text("Sign Up"),
            ),
          )
        ],
      ),
    );
    // ignore: dead_code
  }
}
