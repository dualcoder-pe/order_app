import '../data/model/order.dart';
import '../data/model/order_result.dart';
import '../data/repository/order_repository.dart';

class SendOrderUsecase {
  final OrderRepository _orderRepository;

  SendOrderUsecase(this._orderRepository);

  Future<OrderResult> sendOrder(Order order) => _orderRepository.sendOrder(order);
}
