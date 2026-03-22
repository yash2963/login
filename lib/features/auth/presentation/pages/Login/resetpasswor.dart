import 'package:flutter/material.dart';

import '../../../../../shared/widgets/custombutton.dart';
import '../../../../../shared/widgets/textfield.dart';
import '../../../../../shared/widgets/titletext.dart';

class Reset_password extends StatelessWidget {
  const Reset_password({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            Customtext(
              title: 'Reset Password',
              subtext: 'Remember your password? ',
              actiontext: 'Login',
            ),
            CustomField(
              isPassword: false,
              prefixIcon: Icons.lock_outline,
              hintText: 'New Password',
            ),
            SizedBox(
              height: 25,
            ),
            CustomField(
              isPassword: false,
              prefixIcon: Icons.lock_outline,
              hintText: 'Confirm New Password',
            ),
            SizedBox(
              height: 40,
            ),
            Custom_button(btName: 'Submit')
          ],
        ),
      ),
    );
  }
}
