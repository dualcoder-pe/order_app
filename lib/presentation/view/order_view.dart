import 'package:domain/presentation/bloc/order_bloc.dart';
import 'package:flutter/material.dart';

class OrderView extends StatefulWidget {
  final OrderBloc orderBloc;

  const OrderView({Key? key, required this.orderBloc}) : super(key: key);

  @override
  State<StatefulWidget> createState() => OrderViewState();
}

class OrderViewState extends State<OrderView> {
  var orderId = "";
  var productId = "";
  var name = "";
  var price = "";
  var result = "";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          TextField(
            onChanged: (text) {
              setState(() {
                orderId = text;
              });
            },
            decoration: const InputDecoration(labelText: "Order ID"),
          ),
          TextField(
            onChanged: (text) {
              setState(() {
                productId = text;
              });
            },
            decoration: const InputDecoration(labelText: "Product ID"),
          ),
          TextField(
            onChanged: (text) {
              setState(() {
                name = text;
              });
            },
            decoration: const InputDecoration(labelText: "Product Name"),
          ),
          TextField(
            onChanged: (text) {
              setState(() {
                price = text;
              });
            },
            decoration: const InputDecoration(labelText: "Price"),
          ),
          const SizedBox(height: 10,),
          ElevatedButton(
              onPressed: () {
                widget.orderBloc
                    .send(orderId, productId, name, price)
                    .then((value) => setState(() {
                          result = value.result;
                        }));
              },
              child: const Text("Submit")),
          const SizedBox(height: 10,),
          Text(result),
        ],
      ),
    );
  }
}
