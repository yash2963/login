import 'package:flutter/material.dart';
import 'package:loginapp/features/auth/data/models/registermodel.dart';

class FromHandler {
  static void ValidateAndeNext({
    required BuildContext context,
    // required String fullName,
    // required String email,
    // required String phone,
    required RegisterModel model,
    required Map<String, dynamic> currentPageData,
    String? password,
    String? confirmpassword,
    required Widget NextScreen,
  }) {
    if (
        // fullName.isEmpty ||
        //     email.isEmpty ||
        //     phone.isEmpty ||
        //     password.isEmpty ||
        //     confirmpassword.isEmpty
        currentPageData.values
            .any((data) => data == null || data.toString().isEmpty)) {
      _showError(context, "Please fill all Fields");
      return;
    }

    if (password != null && confirmpassword != null) {
      if (password != confirmpassword) {
        _showError(context, "Password Doesn't match");
        return;
      }
    }
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => NextScreen));
  }

  static void _showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
