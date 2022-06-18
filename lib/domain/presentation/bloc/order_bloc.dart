import '../../data/model/order.dart';
import '../../data/model/order_result.dart';
import '../../data/model/product.dart';
import '../../usecase/send_order_usecase.dart';

class OrderBloc {
  final SendOrderUsecase _sendOrderUsecase;

  // late RemoteDatesource _remoteDataSource;

  OrderBloc(this._sendOrderUsecase);

  Future<OrderResult> send(
      String orderId, String productId, String name, String price) {
    final product = Product(productId, name, price);
    final order = Order(orderId, product);

    // _remoteDataSource = RemoteDatesource();
    // _remoteDataSource.sendOrder(order);

    return _sendOrderUsecase.sendOrder(order);
  }
}
