import 'package:domain/data/model/order.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatasource {
  final dbName = "";

  Future<bool> sendOrder(Order order) async {
    try {
      var db = await openDatabase(dbName);
    } on Exception {
      if (kDebugMode) {
        print("Error");
      }
    }
    return true;
  }
}
