import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loginapp/features/auth/auth_state.dart';
import 'package:loginapp/features/auth/data/application/notifier/forgot_password_notifier.dart';
import 'package:loginapp/features/auth/data/application/notifier/login_notifier.dart';
import 'package:loginapp/features/auth/data/application/notifier/otp_notifier.dart';
import 'package:loginapp/features/auth/data/repositories/Loginservice.dart';
import 'package:loginapp/features/auth/data/repositories/Phoneservice.dart';

final loginServiceProvier = Provider((ref) => Loginservice());

final phonServiceProvider = Provider((ref) => Phoneservice());

final otpServiceProvider = Provider((reft) => OtpService());

final loginProvider = StateNotifierProvider<LoginNotifier, AuthState>(
    (ref) => LoginNotifier(ref.watch(loginServiceProvier)));

final phoneProvider = StateNotifierProvider<ForgotPasswordNotifier, AuthState>(
    (ref) => ForgotPasswordNotifier(ref.watch(phonServiceProvider)));

final otpProvider = StateNotifierProvider<OtpNotifier, AuthState>(
    (ref) => OtpNotifier(ref.watch(otpServiceProvider)));
