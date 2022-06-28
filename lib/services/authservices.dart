import 'package:dio/dio.dart';

import '../models/user.dart';
import 'clients.dart';

class AuthServices {
  Future<String> signup(User user) async {
    String token = "";
    try {
      Response res = await Client.dio.post("/signup", data: user.toJson());
      print(res.data["token"]);
      token = res.data["token"];
    } on DioError catch (error) {
      print(error.message);
    }

    return token;
  }

  Future<String> signin(User user) async {
    String token = "";
    try {
      Response res = await Client.dio.post("/signin", data: user.toJson());
      print(res.data["token"]);
      token = res.data["token"];
    } on DioError catch (error) {
      print(error.message);
    }

    return token;
  }
}
