import 'package:dio/dio.dart';
import '../models/trans.dart';
import 'clients.dart';

class TransServices {
  List<Trans> trans = [];
  Future<List<Trans>> getTransService() async {
    var res = await Client.dio.get('/transactions');
    try {
      trans = (res.data as List).map((e) => Trans.fromJson(e)).toList();
    } on DioError catch (error) {
      print(error.message);
    }
    return trans;
  }
}
