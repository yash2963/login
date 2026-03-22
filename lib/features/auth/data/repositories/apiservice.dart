// import 'dart:convert';
//
// import 'package:http/http.dart' as http;
//
// import 'registermodel.dart';
//
// class ApiService {
//   static const String baseUrl = "https://sowlab.com/assignment/";
//
//   static const Map<String, String> headers = {
//     "Content-Type": "application/json",
//     "Accept": "application/json",
//   };
//
//   Future<Map<String, dynamic>> registerUser(RegisterModel user) async {
//     final url = Uri.parse("$baseUrl/user/register");
//
//     try {
//       // final response = await http.post(
//       //   url,
//       //   headers:headers,
//       //   body:jsonEncode(user.toJson())
//       var request = http.MultipartRequest("POST", url);
//       request.fields['full_name'] = user.fullName ?? "";
//       request.fields['email'] = user.email ?? "";
//       request.fields['phone'] = user.phone ?? "";
//       request.fields['password'] = user.password ?? "";
//       request.fields['role'] = user.role ?? "farmer";
//       request.fields['business_name'] = user.businessName ?? "";
//       request.fields['informal_name'] = user.informalName ?? "";
//       request.fields['address'] = user.address ?? "";
//       request.fields['city'] = user.city ?? "";
//       request.fields['state'] = user.state ?? "";
//       request.fields['zip_code'] = user.zipCode?.toString() ?? "";
//       request.fields['device_token'] = user.deviceToken ?? "token_123";
//       request.fields['type'] = user.type ?? "email";
//       request.fields['social_id'] =
//           user.socialId ?? "0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx";
//
//       if (user.businessHourModel != null) {
//         request.fields['business_hours'] =
//             jsonEncode(user.businessHourModel!.hours);
//       }
//
//       if (user.registrationProof != null &&
//           user.registrationProof!.isNotEmpty) {
//         String ext = user.registrationProof!.split('.').last.toLowerCase();
//         request.files.add(await http.MultipartFile.fromPath(
//           'registration_proof',
//           user.registrationProof!,
//           contentType: MediaType('image', ext == 'jpg' ? 'jpeg' : ext),
//         ));
//       }
//
//       final streamedResponse = await request.send();
//       final response = await http.Response.fromStream(streamedResponse);
//       return _handleResponse(response);
//     } catch (e) {
//       print("API Catch Error: $e");
//
//       throw Exception("Network Error: $e");
//     }
//   }
//
//   Map<String, dynamic> _handleResponse(http.Response response) {
//     // Console mein check karne ke liye (Debugging)
//     print("Status Code: ${response.statusCode}");
//     print("Server Response: ${response.body}");
//
//     try {
//       final decodedResponse = jsonDecode(response.body);
//
//       // Agar status code 200 ya 201 hai toh return karein
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         return decodedResponse;
//       } else {
//         // Agar server error message bhej raha hai (jaise status: false)
//         return decodedResponse;
//       }
//     } catch (e) {
//       // Agar server ne JSON ke bajaye HTML error page bheja hai
//       throw Exception(
//           "Format Error: Server returned an invalid response (Status: ${response.statusCode})");
//     }
//   }
//
// // );
//
// //     return _handleResponse(response);
// //   } catch (e){
// //     throw Exception("Network Error : $e" );
// //   }
// // }
// }

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart'; // IMPORTANT IMPORT

import '../models/registermodel.dart';

class ApiService {
  static const String baseUrl = "https://sowlab.com/assignment";

  Future<Map<String, dynamic>> registerUser(RegisterModel user) async {
    final url = Uri.parse("$baseUrl/user/register");

    try {
      var request = http.MultipartRequest("POST", url);

      // Text Fields
      request.fields['full_name'] = user.fullName ?? "";
      request.fields['email'] = user.email ?? "";
      request.fields['phone'] = user.phone ?? "";
      request.fields['password'] = user.password ?? "";
      request.fields['role'] = user.role ?? "farmer";
      request.fields['business_name'] = user.businessName ?? "";
      request.fields['informal_name'] = user.informalName ?? "";
      request.fields['address'] = user.address ?? "";
      request.fields['city'] = user.city ?? "";
      request.fields['state'] = user.state ?? "";
      request.fields['zip_code'] = user.zipCode?.toString() ?? "";
      request.fields['device_token'] =
          user.deviceToken ?? "0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx";
      request.fields['type'] = user.type ?? "email";
      request.fields['social_id'] =
          user.socialId ?? "0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx";

      if (user.businessHourModel != null) {
        // Ensure business_hours key matches what server expects
        request.fields['business_hours'] =
            jsonEncode(user.businessHourModel!.hours);
      }

      // File Upload
      if (user.registrationProof != null &&
          user.registrationProof!.isNotEmpty) {
        String ext = user.registrationProof!.split('.').last.toLowerCase();
        request.files.add(await http.MultipartFile.fromPath(
          'registration_proof',
          user.registrationProof!,
          contentType: MediaType('image', ext == 'jpg' ? 'jpeg' : ext),
        ));
      }

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);
      return _handleResponse(response);
    } catch (e) {
      print("API Catch Error: $e");
      throw Exception("Network Error: $e");
    }
  }

  Map<String, dynamic> _handleResponse(http.Response response) {
    print("Status Code: ${response.statusCode}");
    print("Server Response Body: ${response.body}");

    try {
      // Agar body khali nahi hai toh decode karein
      if (response.body.isNotEmpty) {
        final decoded = jsonDecode(response.body);
        return decoded;
      }
      return {"status": response.statusCode == 200};
    } catch (e) {
      // Agar FormatException aaye (Unexpected character), toh status code se handle karein
      if (response.statusCode == 200 || response.statusCode == 201) {
        return {"status": true, "message": "Success"};
      }
      throw Exception(
          "Server Error (${response.statusCode}): ${response.body}");
    }
  }
}
