class VerifyOtpRequest {
  String otp;

  VerifyOtpRequest({required this.otp});

  Map<String, dynamic> toJson() {
    return {
      "otp": otp,
    };
  }
}

class VerifyOtpResponse {
  String? success;
  String? message;
  String? token;

  VerifyOtpResponse({
    this.success,
    this.message,
    this.token,
  });

  factory VerifyOtpResponse.fromJson(Map<String, dynamic> json) {
    return VerifyOtpResponse(
      success: json['success'],
      message: json['message'],
      token: json['token'],
    );
  }
}
