// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:order_app/data/datasource/local_datasource.dart';
import 'package:order_app/data/datasource/remote_datasource.dart';
import 'package:order_app/data/repository/order_repository.dart';
import 'package:order_app/main.dart';
import 'package:order_app/presentation/bloc/order_bloc.dart';
import 'package:order_app/usecase/send_order_usecase.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(OrderApp(
        orderBloc: OrderBloc(SendOrderUsecase(
            OrderRepository(LocalDatasource(), RemoteDatesource())))));

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
