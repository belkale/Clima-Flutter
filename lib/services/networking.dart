import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  final Uri url;
  NetworkHelper(this.url);

  dynamic getData() async {
    var result = await http.get(url);
    if (result.statusCode == 200) {
      return jsonDecode(result.body);
    } else {
      print('HTTP Get failed with status code ${result.statusCode}');
    }
  }
}
