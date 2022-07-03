import 'package:flutter/material.dart';

import '../models/trans.dart';
import '../services/trans_services.dart';

class TransProvider extends ChangeNotifier {
  List<Trans> trans = [];
  List<Trans> filteredList = [];
  List<Trans> filteredList1 = [];

  Future<void> getTransProviders() async {
    trans = await TransServices().getTransService();
    trans = trans.reversed.toList();

    notifyListeners();
  }

  Future<List<Trans>> searchAmount(String query) async {
    filteredList = await TransServices().getTransService();

    filteredList = filteredList
        .where((element) => element.amount.toString().contains(query))
        .toList();
    print(filteredList.length);
    filteredList = filteredList.reversed.toList();

    // trans = filteredList;
    return filteredList;
    notifyListeners();
  }

  Future<List<Trans>> filteredAmount(int type) async {
    filteredList1 = await TransServices().getTransService();
    if (type == 1) {
      filteredList1 = filteredList1
          .where((element) => element.type.contains("deposit"))
          .toList();

      print("Deposit Filter");
      return filteredList1;
    } else if (type == 2) {
      filteredList1 = filteredList1
          .where((element) => element.type.contains("withdraw"))
          .toList();
      print("Withdraw Filter");
      return filteredList1;
    } else if (type == null) {
      filteredList1 = trans;
      print("All");
      return filteredList1;
    } else {
      filteredList1 = filteredList1
          .where((element) => element.type.contains("transfer"))
          .toList();
      print("Transfer Filter");
      return filteredList1;
    }
    notifyListeners();
  }
}
