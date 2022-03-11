// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_personal_money_app/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

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
import 'package:Flutter_Personal_Expenses_App/widget_test.dart';
import 'dart:convert';
import 'package:test/test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

void main() {
  final provider = NewsApiProvider();

  test('Sample test', () {
    // SETUP
    final sum = 1 + 3;
    // EXPECTATION
    expect(sum, 4);
  });

  test('Fetch ids from the api call', () async {
    final mockClient = MockClient((request) async {
      return Response(json.encode([1, 2, 3, 4]), 200);
    });
    provider.client = mockClient;
    final ids = await provider.fetchTopIds();
    expect(ids, [1, 2, 3, 4]);
  });

  test('Fetch item returns a item model', () async {
    final mockClient = MockClient((request) async {
      final jsonMap = {'id': 123};
      return Response(json.encode(jsonMap), 200);
    });
    provider.client = mockClient;
    final item = await provider.fetchItem(1);
    expect(item.id, 123);
  });
