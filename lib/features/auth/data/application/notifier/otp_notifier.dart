import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loginapp/features/auth/auth_state.dart';
import 'package:loginapp/features/auth/data/models/Phonemodel.dart';
import 'package:loginapp/features/auth/data/repositories/Phoneservice.dart';

class OtpNotifier extends StateNotifier<AuthState> {
  final OtpService _service;
  OtpNotifier(this._service) : super(AuthState());

  Future<void> handleOtp(OtpModel otpData) async {
    state = AuthState(isLoading: true);

    try {
      bool _isVerified = await _service.verifyOtp(otpData);

      if (_isVerified) {
        state = AuthState(isSuccess: true);
      } else {
        state = AuthState(errorMessage: "Invalid OTP!");
      }
    } catch (e) {
      state = AuthState(errorMessage: e.toString());
    }
  }
}
