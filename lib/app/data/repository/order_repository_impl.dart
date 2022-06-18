import '../../../domain/data/model/order.dart';
import '../../../domain/data/model/order_result.dart';
import '../../../domain/data/repository/order_repository.dart';
import '../datasource/local_datasource.dart';
import '../datasource/remote_datasource.dart';

class OrderRepositoryImpl extends OrderRepository {
  final LocalDatasource _localDatasource;
  final RemoteDatesource _remoteDatesource;

  OrderRepositoryImpl(this._localDatasource, this._remoteDatesource);

  @override
  Future<OrderResult> sendOrder(Order order) async {
    final localRes = await _localDatasource.sendOrder(order);
    final remoteRes = await _remoteDatesource.sendOrder(order);
    return OrderResult((localRes && remoteRes) ? "SUCCESS" : "Fail");
  }
}
