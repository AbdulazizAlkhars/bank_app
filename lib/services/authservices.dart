import 'package:bank_app/models/deposit.dart';
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

  Future<void> addDepositService(int deposit) async {
    Deposit data = Deposit(amount: deposit);
    try {
      var req = await Client.dio.put('/deposit', data: data.toJson());
    } on DioError catch (error) {
      print(error.response!.data);
    }
  }

  Future<void> withDrawalService(int withdrawal) async {
    Deposit data = Deposit(amount: withdrawal);
    await Client.dio.put('/withdraw', data: data.toJson());
  }

  Future<void> transferService(int transfer, String username) async {
    Deposit data = Deposit(amount: transfer);
    await Client.dio.post('/transfer/$username', data: data.toJson());
  }
}
