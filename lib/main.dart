import 'package:flutter/material.dart';

import 'app/data/datasource/local_datasource.dart';
import 'app/data/datasource/remote_datasource.dart';
import 'app/data/repository/order_repository_impl.dart';
import 'app/presentation/view/order_view.dart';
import 'domain/presentation/bloc/order_bloc.dart';
import 'domain/usecase/send_order_usecase.dart';

void main() {
  runApp(OrderApp(
      orderBloc: OrderBloc(SendOrderUsecase(
          OrderRepositoryImpl(LocalDatasource(), RemoteDatesource())))));
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
