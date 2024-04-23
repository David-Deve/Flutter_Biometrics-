import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpRequest {
  String name = '';
  String money = '';

  Future<void> getData() async {
    const url = 'http://10.0.0.19:3031/employees/1';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    Map<String, dynamic> data = jsonDecode(response.body);
    final name = data['name'];
    final money = data['money'];
    this.name = name;
    this.money = money;
  }
}
