import 'package:loginapp/features/auth/data/models/Phonemodel.dart';
import 'package:loginapp/features/auth/data/repositories/Phoneservice.dart';

// class Passwordcontroller {
//   Future<bool> handlePassword(int phone) async {
//     try {
//       PasswordModel credential = PasswordModel(phone: phone);
//       // bool isSent = await PasswordService(credential);
//       final Phoneservice _service = Phoneservice();
//       bool isSent = await _service.sendOtp(credential);
//       return isSent;
//     } catch (e) {
//       print("Error Controller: $e");
//       return false;
//     }
//   }
// }

class OtpController {
  final OtpService _otpservice;
  OtpController(this._otpservice);
  Future<bool> handleOtp(OtpModel otpData) async {
    try {
      // OtpModel onetimepassword = (otpData);]
      bool isrecived = await _otpservice.verifyOtp(otpData);
      return isrecived;
    } catch (e) {
      print("Error Controller: $e");
      return false;
    }
  }
}
// bool isrecived = await _otpservice.verifyotp(otpData.otp);
