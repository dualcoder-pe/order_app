import 'package:flutter/material.dart';

import 'data/datasource/local_datasource.dart';
import 'data/datasource/remote_datasource.dart';
import 'data/repository/order_repository.dart';
import 'presentation/bloc/order_bloc.dart';
import 'presentation/view/order_view.dart';
import 'usecase/send_order_usecase.dart';

void main() {
  runApp(OrderApp(
      orderBloc: OrderBloc(SendOrderUsecase(
          OrderRepository(LocalDatasource(), RemoteDatesource())))));
}

class OrderApp extends StatelessWidget {
  const OrderApp({Key? key, required this.orderBloc}) : super(key: key);

  final OrderBloc orderBloc;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(
        title: 'Flutter Clean Atchitecture Demo',
        orderBloc: orderBloc,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.title, required this.orderBloc})
      : super(key: key);

  final String title;
  final OrderBloc orderBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: OrderView(orderBloc: orderBloc),
      ),
    );
  }
}
