// import '../../../../data/BusinessHourModel.dart';
import '../../../signup/data/data/models/BusinessHourModel.dart';

class RegisterModel {
  String? fullName;
  String? email;
  String?
      phone; // Professional tip: Phone ko String rakhein taaki '+' sign handle ho sake
  String? password;
  String? role;
  String? businessName;
  String? informalName;
  String? address;
  String? city;
  String? state;
  int? zipCode;
  String? registrationProof;
  BusinessHourModel? businessHourModel;
  String? deviceToken;
  String? type;
  String? socialId;

  RegisterModel({
    this.fullName,
    this.email,
    this.phone,
    this.password,
    this.role = "farmer",
    this.businessName,
    this.informalName,
    this.address,
    this.city,
    this.state,
    this.zipCode,
    this.registrationProof,
    this.businessHourModel,
    this.deviceToken = "token_123",
    this.type = "email",
    this.socialId = "0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx",
  });

  Map<String, dynamic> toJson() {
    return {
      "full_name": fullName,
      "email": email,
      "phone": phone,
      "password": password,
      "role": role,
      "business_name": businessName,
      "informal_name": informalName,
      "address": address,
      "city": city,
      "state": state,
      "zip_code": zipCode,
      "registration_proof": registrationProof,
      "business_hour": businessHourModel?.hours ?? {},
      "device_token": deviceToken,
      "type": type,
      "social_id": socialId,
    };
  }
}
