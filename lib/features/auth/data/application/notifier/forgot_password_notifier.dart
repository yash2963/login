import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loginapp/features/auth/auth_state.dart';
import 'package:loginapp/features/auth/data/models/Phonemodel.dart';
import 'package:loginapp/features/auth/data/repositories/Phoneservice.dart';

class ForgotPasswordNotifier extends StateNotifier<AuthState> {
  final Phoneservice _service;
  ForgotPasswordNotifier(this._service) : super(AuthState());

  Future<void> handlePassword(String phone) async {
    state = AuthState(isLoading: true);
    try {
      PasswordModel credential = PasswordModel(mobile: phone);
      bool isSent = await _service.sendOtp(credential);
      print('SendOtp returned: $isSent');

      if (isSent) {
        state = AuthState(isLoading: false, isSuccess: true);
      } else {
        state =
            AuthState(isLoading: false, errorMessage: "Invalid Phone Number");
      }
    } catch (e) {
      state = AuthState(
          isLoading: false, isSuccess: false, errorMessage: e.toString());
    }
  }
}
