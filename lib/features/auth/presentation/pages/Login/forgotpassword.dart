// import 'package:flutter/material.dart';
// import 'package:jobapp/shared/custombutton.dart';
// import 'package:jobapp/shared/textfield.dart';
// import 'package:jobapp/shared/titletext.dart';
//
// class Password extends StatelessWidget {
//   const Password({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 30.0),
//         child: Column(
//           children: [
//             Customtext(title: 'Forgot Password?',
//               subtext: 'Remember your password? ',
//             actiontext: 'Login',
//           ),
//             CustomField(hintText: 'Phone Number', prefixIcon: Icons.phone_outlined, isPassword: false),
//           SizedBox(height: 35,),
//             Custom_button(btName: 'Send Code')
//           ]
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loginapp/features/auth/application/provider/auth_provider.dart';
import 'package:loginapp/features/auth/presentation/pages/Login/loginpage.dart';
import 'package:loginapp/features/auth/presentation/pages/Login/verifyopt.dart';

import '../../../../../shared/widgets/custombutton.dart';
import '../../../../../shared/widgets/textfield.dart';
import '../../../../../shared/widgets/titletext.dart';

class Password extends ConsumerWidget {
  // const Password({super.key});

//   @override
//   State<Password> createState() => _PasswordState();
// }

// class _PasswordState extends State<Password> {
  @override
  // final Passwordcontroller _controller = Passwordcontroller();
  final TextEditingController phoneNumber = TextEditingController();

  // bool _isloading = false;

  Widget build(BuildContext context, WidgetRef ref) {
    // Get screen dimensions
    final forgotstate = ref.watch(phoneProvider);
    ref.listen(phoneProvider, (previous, next) {
      if (next.isSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("OTP Sent Successfully!"),
          backgroundColor: Colors.green,
        ));
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Verify_opt()));
      }
      if (next.errorMessage != null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(next.errorMessage!),
          backgroundColor: Colors.red,
        ));
      }
    });
    final size = MediaQuery.of(context).size;
    final double h = size.height;
    final double w = size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        // Side padding is 8% of screen width
        padding: EdgeInsets.symmetric(horizontal: w * 0.08),
        child: Column(
          children: [
            // Top spacing (scaled to 8% of screen height)
            SizedBox(height: h * 0.08),

            Customtext(
              title: 'Forgot Password?',
              subtext: 'Remember your password? ',
              actiontext: 'Login',
              onActionTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Loginpage()));
              },
            ),

            // Gap between text and input
            SizedBox(height: h * 0.04),

            CustomField(
                hintText: 'Phone Number / Email',
                controller: phoneNumber,
                prefixIcon: Icons.phone_outlined,
                isPassword: false),

            // Proportional gap (4% of screen height)
            SizedBox(height: h * 0.04),

            // Send Code Button
            // Using a width of 100% (minus padding) or a specific percentage
            SizedBox(
              width: double.infinity,
              height: 52, // Standard height for better touch targets
              child: Custom_button(
                  btName: forgotstate.isLoading ? 'Sending...' : 'Send Code',
                  onTap: forgotstate.isLoading
                      ? null
                      : () {
                          final phone = phoneNumber.text.trim();
                          if (phone.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content:
                                    Text("Please Enter the phone number")));
                            return;
                          }
                          // setState(() {
                          //   isloading = true;
                          // });
                          // try {
                          //   bool isSuccess = await _controller
                          //       .handlePassword(int.parse(phoneNumber.text));
                          //   setState(() {
                          //     _isloading = false;
                          //   });
                          //   if (isSuccess) {
                          //     ScaffoldMessenger.of(context)
                          //         .showSnackBar(SnackBar(
                          //       content: Text("Opt Sent Sucessfully!"),
                          //       backgroundColor: Colors.green,
                          //     ));
                          //
                          //     // if (isSuccess) {
                          //     Navigator.push(
                          //         context,
                          //         MaterialPageRoute(
                          //             builder: (context) => Verify_opt()));
                          //   } else {
                          //     ScaffoldMessenger.of(context).showSnackBar(
                          //       SnackBar(
                          //         content: Text(
                          //             "Opps! Entered Number is not valied"),
                          //         backgroundColor: Colors.red,
                          //       ),
                          //     );
                          //   }
                          // } catch (e) {
                          //   setState(() {
                          //     _isloading = false;
                          //   });
                          // final phone = int.tryParse(phoneNumber.text);
                          // if(phone == null){
                          //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          //     content:
                          //         Text("Please enter valid number"),
                          //     backgroundColor: Colors.orange,
                          //   ));
                          //   // print('parsed phone: $phone');
                          //   return;
                          // }
                          final formattedPhone =
                              phone.startsWith('+') ? phone : '+$phone';
                          ref
                              .read(phoneProvider.notifier)
                              .handlePassword(formattedPhone);
                        }),
            ),

            // If you want the button at the bottom, use Spacer() before it.
            // If you want it grouped at the top, leave it as is.
          ],
        ),
      ),
    );
  }
}
