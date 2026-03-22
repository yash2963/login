import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:loginapp/features/auth/data/models/Phonemodel.dart';

// final http.Client _client = http.Client();
class Phoneservice {
  Future<bool> sendOtp(PasswordModel Data) async {
    final url = Uri.parse("https://sowlab.com/assignment/user/forgot-password");

    try {
      final response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(Data.toJson()));
      print('Status: ${response.statusCode}');  // ← add
      print('Body: ${response.body}');
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return json['success'] == 'true';
      } else {
        return false;
      }
    } catch (e) {
      print("Network Error: $e");
      return false;
    }
  }
}

class OtpService {
  static const String baseUrl =
      "https://49c5355d-dbb3-48d3-9ea3-e2b69fcfb699.mock.pstmn.io";

// Global level par ya class ke andar
  Future<bool> verifyOtp(OtpModel otpData) async {
    final otpurl = Uri.parse("$baseUrl/test");
    try {
      final otpresponse = await http.post(otpurl,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(otpData.toJson()));
      print("Status: ${otpresponse.statusCode}");
      print("Body: ${otpresponse.body}");

      if (otpresponse.statusCode == 200 &&
          otpresponse.body.trim().toLowerCase().contains("success")) {
        return true;
      }
      return false;
    } catch (e) {
      print("Error: $e");
      return false;
    }
  }
}

class ResetService {
  Future<bool> resetpassword(ResetPasswordModel ResetData) async {
    final url = Uri.parse("https://sowlab.com/assignment/user/reset-password");
    try {
      final response = await http.post(url,
          headers: {
            "Content-Type": "application/json",
          },
          body: jsonEncode(ResetData.toJson()));
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
