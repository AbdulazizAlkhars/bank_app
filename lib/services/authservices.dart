import 'package:dio/dio.dart';

import '../models/user.dart';
import 'clients.dart';

class AuthServices {
  Future<String> signup({required User user}) async {
    String token = "";
    try {
      FormData data = FormData.fromMap({
        "username": user.username,
        "password": user.password,
        if (user.image != null)
          "image": await MultipartFile.fromFile(user.image!)
      });
      Response res = await Client.dio.post("/signup", data: data);
      print(res.data["token"]);
      token = res.data["token"];
    } on DioError catch (error) {
      print("error");
    }

    return token;
  }

  Future<String> signin({required User user}) async {
    late String token;
    try {
      Response response = await Client.dio.post('/signin', data: user.toJson());
      token = response.data["token"];
    } on DioError catch (error) {
      print(error.message);
    }
    return token;
  }
}

bool mazaj = true;
var e = ["Milk", if (mazaj) "Coffee", "Water"];
