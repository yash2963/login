import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loginapp/features/auth/application/PhoneController.dart';
import 'package:loginapp/features/auth/application/provider/auth_provider.dart';
import 'package:loginapp/features/auth/data/models/Phonemodel.dart';
import 'package:loginapp/features/auth/presentation/pages/Login/resetpasswor.dart';

import '../../../../../shared/widgets/custombutton.dart';
import '../../../../../shared/widgets/textfield.dart';
import '../../../../../shared/widgets/titletext.dart';

class Verify_opt extends ConsumerWidget {
//
//   @override
//   State<Verify_opt> createState() => _Verify_optState();
// }

// class _Verify_optState extends State<Verify_opt> {
//   // OtpController _controller = OtpController();

  TextEditingController otp1 = TextEditingController();
  TextEditingController otp2 = TextEditingController();
  TextEditingController otp3 = TextEditingController();
  TextEditingController otp4 = TextEditingController();
  TextEditingController otp5 = TextEditingController();
  TextEditingController otp6 = TextEditingController();

  bool _isloading = false;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final OtpState = ref.watch(otpProvider);
    ref.listen(otpProvider, (previous, next) {
      if (next.isSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("OTP verified Successfully!"),
          backgroundColor: Colors.green,
        ));
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Reset_password()));
      }
      if (next.errorMessage != null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(next.errorMessage!),
          backgroundColor: Colors.red,
        ));
      }
    });
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: [
            const Customtext(
              title: 'Verify OTP',
              subtext: 'Remember you password? ',
              actiontext: 'Login',
            ),
            const SizedBox(
              height: 55,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
// Row ke andar 5 baar ise call karein
                _otpField(otp1, context),
                _otpField(otp2, context),
                _otpField(otp3, context),
                _otpField(otp4, context),
                _otpField(otp5, context),
                _otpField(otp6, context)
                // ,const SizedBox(height: 8,),
                // const CustomField(isPassword: true,),
                // const SizedBox(height: 8,),
                // const CustomField(isPassword: true,),
                // const SizedBox(height: 8,),
                // const CustomField(isPassword: true,),
                // const SizedBox(height: 8,) ,
                // const CustomField(isPassword: true,),
                // const SizedBox(height: 8,),
                // Expanded(child: CustomField(isPassword: true,)),
                // SizedBox(height: 8,),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Custom_button(
                btName: _isloading ? "Verifying..." : "Submit",
                onTap: _isloading
                    ? null
                    : () async {
                        String fullOtp = otp1.text +
                            otp2.text +
                            otp3.text +
                            otp4.text +
                            otp5.text +
                            otp6.text;
                        if (fullOtp.length < 6) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Please Enter the 6 digit Otp!!"),
                            backgroundColor: Colors.orange,
                          ));
                          return;
                        }
                       OtpModel otpData = OtpModel(otp: fullOtp);
                        ref.read(otpProvider.notifier).handleOtp(otpData);
                      }
                      ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {},
              child: Text(
                'Resend Code',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget _otpField(
TextEditingController controller,
BuildContext context,){
  return CustomField(
isPassword: false,
width: 55,
textAlign: TextAlign.center,
controller: controller,
KeyboardType: TextInputType.number,
inputFormatters: [
LengthLimitingTextInputFormatter(1),
FilteringTextInputFormatter.digitsOnly,
],
onChanged: (value) {
if (value.length == 1) {
FocusScope.of(context).nextFocus();
} else if (value.isEmpty) {
FocusScope.of(context).previousFocus();
}
},
);
}
