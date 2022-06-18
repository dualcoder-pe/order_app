import 'package:dio/dio.dart';
import 'package:domain/data/model/order.dart';

class RemoteDatesource {
  final url = "";

  Future<bool> sendOrder(Order order) async {
    var response = await Dio().get(url);
    return true;
  }
}
