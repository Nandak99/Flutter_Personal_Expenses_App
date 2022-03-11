import 'package:Flutter_personal_expenses_app/news_api_provider.dart';
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



}
