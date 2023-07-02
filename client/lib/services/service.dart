import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:client/utils/api_endPoints.dart';

class Services {
  static Future<http.Response> registerNewUSer(
      String name, String email, String password) async {
    Uri url = Uri.parse('${ApiEndpoints.baseUrl}/users/register');
    Map body = {"name": name, "email": email, "password": password};
    http.Response response =
        await http.post(url, body: jsonEncode(body), headers: {
      'Content-Type': 'application/json',
      'request-from': 'app',
      // 'Authorization': 'Bearer ${token}'
    });
    return response;
  }

  static Future<http.Response> deleteTodo(String id) async {
    Uri url = Uri.parse('${ApiEndpoints.baseUrl}/todos/deleteTodo?id=${id}');
    var response = await http.delete(url);
    return response;
  }

  static Future<http.Response> createTodo(
      String title, String description) async {
    Uri url = Uri.parse('${ApiEndpoints.baseUrl}/todos/createTodo');
    Map body = {
      "title": title,
      "description": description,
    };
    http.Response response =
        await http.post(url, body: jsonEncode(body), headers: {
      'Content-Type': 'application/json',
      'request-from': 'app',
      // 'Authorization': 'Bearer ${token}'
    });
    return response;
  }

  static Future<http.Response> getTodo() async {
    Uri url = Uri.parse('${ApiEndpoints.baseUrl}/todos/getTodos');
    http.Response response = await http.get(url);
    return response;
  }

  static Future<http.Response> loginUSer(String email, String password) async {
    Uri url = Uri.parse('${ApiEndpoints.baseUrl}/users/login');
    Map body = {"email": email, "password": password};
    http.Response response =
        await http.post(url, body: jsonEncode(body), headers: {
      'Content-Type': 'application/json',
      'request-from': 'app',
      // 'Authorization': 'Bearer ${token}'
    });
    return response;
  }
}
