import 'package:flutter/material.dart';

import '../models/trans.dart';
import '../services/trans_services.dart';

class TransProvider extends ChangeNotifier {
  List<Trans> trans = [];

  Future<void> getTransProviders() async {
    trans = await TransServices().getTransService();
    trans = trans.reversed.toList();

    notifyListeners();
  }
}
