// /// email : "johndoe@mail.com"
// /// password : "12345678"
// /// role : "farmer"
// /// device_token : "0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx"
// /// type : "email/facebook/google/apple"
// /// social_id : "0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx"
//
// class LogModel {
//   LogModel({
//     String? email,
//     String? password,
//     String? role,
//     String? deviceToken,
//     String? type,
//     String? socialId,
//   }) {
//     _email = email;
//     _password = password;
//     _role = role;
//     _deviceToken = deviceToken;
//     _type = type;
//     _socialId = socialId;
//   }
//
//   LogModel.fromJson(dynamic json) {
//     _email = json['email'];
//     _password = json['password'];
//     _role = json['role'];
//     _deviceToken = json['device_token'];
//     _type = json['type'];
//     _socialId = json['social_id'];
//   }
//   String _email;
//   String _password;
//   String _role;
//   String _deviceToken;
//   String _type;
//   String _socialId;
//   LogModel copyWith({
//     String email,
//     String password,
//     String role,
//     String deviceToken,
//     String type,
//     String socialId,
//   }) =>
//       LogModel(
//         email: email ?? _email,
//         password: password ?? _password,
//         role: role ?? _role,
//         deviceToken: deviceToken ?? _deviceToken,
//         type: type ?? _type,
//         socialId: socialId ?? _socialId,
//       );
//   String get email => _email;
//   String get password => _password;
//   String get role => _role;
//   String get deviceToken => _deviceToken;
//   String get type => _type;
//   String get socialId => _socialId;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['email'] = _email;
//     map['password'] = _password;
//     map['role'] = _role;
//     map['device_token'] = _deviceToken;
//     map['type'] = _type;
//     map['social_id'] = _socialId;
//     return map;
//   }
// }

class LogModel {
  // 1. Simple variables (final matlab ek baar set hone ke baad change nahi honge)
  final String? email;
  final String? password;
  final String? role;
  final String? deviceToken;
  final String? type;
  final String? socialId;

  // 2. Chota aur saaf Constructor
  LogModel({
    this.email,
    this.password,
    this.role,
    this.deviceToken,
    this.type,
    this.socialId,
  });

  factory LogModel.fromJson(Map<String, dynamic> json) {
    return LogModel(
      email: json['email'],
      password: json['password'],
      role: json['role'],
      deviceToken: json['device_token'],
      type: json['type'],
      socialId: json['social_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'role': role,
      'device_token': deviceToken,
      'type': type,
      'social_id': socialId,
    };
  }
}
