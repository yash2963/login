import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loginapp/features/auth/data/models/LogModel.dart';
import 'package:loginapp/features/auth/data/repositories/Loginservice.dart';

import '../../../auth_state.dart';

class LoginNotifier extends StateNotifier<AuthState> {
  final Loginservice _service;
  LoginNotifier(this._service) : super(AuthState());
  Future<void> handleLogin(String email, String password) async {
    state = AuthState(isLoading: true);

    try {
      final loginData = LogModel(
        email: email,
        password: password,
        role: "farmer",
        deviceToken: "0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx",
        type: "email",
        socialId: "0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx",
      );

      await _service.LoginUser(loginData);
      state = AuthState(isLoading: false, isSuccess: true);
    } catch (e) {
      state = AuthState(
          isLoading: false, isSuccess: false, errorMessage: e.toString());
    }
  }

  void reset() {
    state = AuthState();
  }
}
