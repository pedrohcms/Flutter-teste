import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  static final String baseURL = 'http://192.168.15.4/api/v1';
  static Map content;

  static Future<void> sendRequest(String method, String endpoint,
      [Map body, Map headers]) async {
    var response;

    try {
      switch (method) {
        case 'GET':
          response = await http.get('$baseURL' + endpoint);
          Api.content = jsonDecode(response.body);

          break;
        case 'POST':
          response = await http.post('$baseURL' + endpoint,
              body: body, headers: headers);
          Api.content = jsonDecode(response.body);

          break;
        case 'PUT':
          response = await http.put('$baseURL' + endpoint,
              body: body, headers: headers);
          Api.content = jsonDecode(response.body);

          break;
        case 'DELETE':
          response = await http.delete('$baseURL' + endpoint, headers: headers);
          Api.content = jsonDecode(response.body);

          break;
      }
    } catch (e) {
      Api.content["error"] = e.toString();
    }
  }
}
