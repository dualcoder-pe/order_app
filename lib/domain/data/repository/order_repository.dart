import '../model/order.dart';
import '../model/order_result.dart';

abstract class OrderRepository {
  Future<OrderResult> sendOrder(Order order);
}
