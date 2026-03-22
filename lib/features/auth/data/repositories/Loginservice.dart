import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:loginapp/features/auth/data/models/LogModel.dart';

class Loginservice {
  Future<void> LoginUser(LogModel loginData) async {
    final url = Uri.parse("https://sowlab.com/assignment/user/login");

    try {
      final response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(loginData.toJson()));

      if (response.statusCode == 200) {
        print("Login Successful");
      } else {
        print("Login Failed");
      }
    } catch (e) {
      print("Network Error: $e");
    }
  }
}
