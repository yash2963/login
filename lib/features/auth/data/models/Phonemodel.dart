class PasswordModel {
  final String mobile;

  PasswordModel({required this.mobile});

  Map<String, dynamic> toJson() {
    return {
      "mobile": mobile,
    };
  }
}

class OtpModel {
  final String otp;
  OtpModel({required this.otp});

  Map<String, dynamic> toJson() {
    return {"otp": otp};
  }
}

class ResetPasswordModel {
  String token;
  String password;
  String cpassword;

  ResetPasswordModel(
      {required this.token, required this.password, required this.cpassword});

  Map<String, dynamic> toJson() {
    return {"token": token, "password": password, "cpassword": cpassword};
  }
}
