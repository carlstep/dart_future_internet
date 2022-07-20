import 'dart:convert';

import 'package:dart_future_internet/dart_future_internet.dart'
    as dart_future_internet;
import 'package:http/http.dart';

void main(List<String> arguments) async {
  var data = await fetchData();

  print(data);
}

Future<Map<String, dynamic>> fetchData() async {
  final response = await get(
      Uri.parse('https://dl.dropbox.com/s/3xj2mgw6q8ieazh/test.json?dl=0'));

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to get data');
  }
}
