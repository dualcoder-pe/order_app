import 'package:order_app/data/datasource/local_datasource.dart';
import 'package:order_app/data/datasource/remote_datasource.dart';

import '../model/order.dart';
import '../model/order_result.dart';

class OrderRepository {
  final LocalDatasource _localDatasource;
  final RemoteDatesource _remoteDatesource;

  OrderRepository(this._localDatasource, this._remoteDatesource);

  Future<OrderResult> sendOrder(Order order) async {
    final localRes = await _localDatasource.sendOrder(order);
    final remoteRes = await _remoteDatesource.sendOrder(order);
    return OrderResult((localRes && remoteRes) ? "SUCCESS" : "Fail");
  }
}
