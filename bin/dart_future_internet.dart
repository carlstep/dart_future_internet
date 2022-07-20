import 'dart:convert';

import 'package:dart_future_internet/dart_future_internet.dart'
    as dart_future_internet;
import 'package:http/http.dart';

void main(List<String> arguments) async {
  var data = await fetchData();

  //print(data['books'][2]['title']);
  //print('${data['books'][2]['title']} has ${data['books'][2]['pages']} pages');

  List books = data['books'];
  for (int i = 0; i < books.length; i++) {
    print('');
    print('Title ----> ${books[i]['title']} (${books[i]['pages']} pages)');
    print('${books[i]['website']}');
  }
}

Future<Map<String, dynamic>> fetchData() async {
  final response = await get(
      Uri.parse('https://dl.dropbox.com/s/yhwofe08r459zf5/stories.json?dl=0'));

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to get data');
  }
}
