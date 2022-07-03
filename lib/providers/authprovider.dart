import 'dart:io';

import 'package:bank_app/models/deposit.dart';
import 'package:bank_app/models/trans.dart';
import 'package:bank_app/services/trans_services.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';
import '../services/authservices.dart';
import '../services/clients.dart';

class UserProvider extends ChangeNotifier {
  User? user;
  String token = "";

  Future<bool> signup(User user) async {
    try {
      token = await AuthServices().signup(user: user);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("myToken", token);
      this.user = User.fromJson(Jwt.parseJwt(token));
      Client.dio.options.headers = {
        HttpHeaders.authorizationHeader: 'Bearer $token',
      };
      notifyListeners();
      return true;
    } on Exception catch (e) {
      return false;
    }
  }

  Future<bool> signin(User user) async {
    try {
      token = await AuthServices().signin(user: user);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("myToken", token);
      user = User.fromJson(Jwt.parseJwt(token));
      Client.dio.options.headers = {
        HttpHeaders.authorizationHeader: 'Bearer $token',
      };
      notifyListeners();
      return true;
    } on Exception catch (e) {
      return false;
    }
  }

  bool get isAuth {
    getToken();
    if (token.isNotEmpty && Jwt.getExpiryDate(token)!.isAfter(DateTime.now())) {
      user = User.fromJson(Jwt.parseJwt(token));
      Client.dio.options.headers = {
        HttpHeaders.authorizationHeader: 'Bearer $token',
      };
      return true;
    }
    logout();
    return false;
  }

  void setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  void getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token') ?? "";
    notifyListeners();
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    token = "";
    notifyListeners();
  }

  void addDeposit(int amount) async {
    user?.balance = (user?.balance ?? 0) + amount;
    await AuthServices().addDepositService(amount);
    notifyListeners();
  }

  void withDrawal(int amount) async {
    if (amount < (user?.balance ?? 0) && user?.balance != 0) {
      await AuthServices().withDrawalService(amount);
      user?.balance = (user?.balance ?? 0) - amount;
      notifyListeners();
    }
  }

  void transferProvider(int transferProvider, String username) async {
    await AuthServices().transferService(transferProvider, username);
    user?.balance = (user?.balance ?? 0) - transferProvider;
    notifyListeners();
  }

  Future<bool> editProfileProvider(User user) async {
    try {
      token = await AuthServices().editProfile(user: user);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("myToken", token);
      this.user = User.fromJson(Jwt.parseJwt(token));
      Client.dio.options.headers = {
        HttpHeaders.authorizationHeader: 'Bearer $token',
      };
      notifyListeners();
      return true;
    } on Exception catch (e) {
      return false;
    }
  }
}


  // void getTransactionsProvider() async {
  //   await AuthServices().getTransactionsService();
  // }

