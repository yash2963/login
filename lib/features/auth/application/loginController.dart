import 'package:loginapp/features/auth/data/models/LogModel.dart';
import 'package:loginapp/features/auth/data/repositories/apiservice.dart';

class Logincontroller {
  // final LoginController _loginUser = LoginController();
  bool isloading = true;
  // final AuthService _authService = AuthService();

  Future<void> handleLogin(String email, String password) async {
    LogModel loginData = LogModel(
      email: email,
      password: password,
      role: "farmer",
      deviceToken: "0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx",
      type: "email",
      socialId: "0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx",
    );
    await ApiService;
  }
}
