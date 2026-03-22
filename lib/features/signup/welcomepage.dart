// import 'package:flutter/material.dart';
// import 'package:revision/data/registermodel.dart';
// import 'package:revision/shared/custombutton.dart';
// import 'package:revision/shared/socialicon.dart';
// import 'package:revision/shared/textfield.dart';
// import 'package:revision/shared/titletext.dart';
//
// import '../../utils/buttonfunctoin.dart';
// import 'farminfo.dart';
//
// class WelcomePage extends StatefulWidget {
//   const WelcomePage({super.key});
//
//   @override
//   State<WelcomePage> createState() => _WelcomePageState();
// }
//
// class _WelcomePageState extends State<WelcomePage> {
//   final fullNameController = TextEditingController();
//
//   final emailController = TextEditingController();
//
//   final phoneController = TextEditingController();
//
//   final passwordController = TextEditingController();
//
//   final confirmPasswordController = TextEditingController();
//   RegisterModel myData = RegisterModel();
//   bool isloading = false;
//
//   @override
//   void dispose() {
//     fullNameController.dispose();
//     emailController.dispose();
//     passwordController.dispose();
//     passwordController.dispose();
//     confirmPasswordController.dispose();
//     super.dispose();
//   }
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 30),
//         child: Column(
//           children: [
//             Customtext(
//               isCenter: false,
//               title: 'Welcome',
//               uptext: 'Signup 1 of 4',
//             ),
//             SizedBox(
//               height: 15,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 CustomButton(
//                   width: 15,
//                   height: 15,
//                   image: 'assets/images/google.png',
//                   imagewidth: 20,
//                 ),
//                 CustomButton(
//                   width: 15,
//                   height: 15,
//                   image: 'assets/images/apple.png',
//                   imagewidth: 20,
//                 ),
//                 CustomButton(
//                   width: 15,
//                   height: 15,
//                   image: 'assets/images/facebook.png',
//                   imagewidth: 20,
//                 ),
//                 CustomButton(
//                   width: 15,
//                   height: 15,
//                   image: 'assets/images/x.png',
//                   imagewidth: 20,
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 25,
//             ),
//             Text(
//               'or sign up with',
//               style: TextStyle(fontSize: 12, color: Colors.grey),
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             CustomField(
//               isPassword: false,
//               prefixIcon: Icons.person_outline,
//               hintText: 'Full Name',
//               controller: fullNameController,
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             CustomField(
//               isPassword: false,
//               prefixIcon: Icons.alternate_email_rounded,
//               hintText: 'Email Address',
//               controller: emailController,
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             CustomField(
//               isPassword: false,
//               prefixIcon: Icons.phone_outlined,
//               hintText: 'Phone Number',
//               controller: phoneController,
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             CustomField(
//               isPassword: false,
//               prefixIcon: Icons.lock_outline,
//               hintText: 'Password',
//               controller: passwordController,
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             CustomField(
//               isPassword: false,
//               prefixIcon: Icons.lock_outline,
//               hintText: 'Re-enter Password',
//               controller: confirmPasswordController,
//             ),
//             // SizedBox(height: 50,),
//             Spacer(),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 TextButton(
//                     onPressed: () {},
//                     child: Text(
//                       'Login',
//                       style: TextStyle(
//                           decoration: TextDecoration.underline, fontSize: 18),
//                     )),
//                 Custom_button(
//                   btName: 'Continue',
//                   onTap: () {
//                     myData.fullName = fullNameController.text.trim();
//                     myData.email = emailController.text.trim();
//                     myData.phone = phoneController.text.trim();
//                     myData.password = passwordController.text.trim();
//                     // myData.confirmpassword: confirmPasswordController.text.trim();
//                     FromHandler.ValidateAndeNext(
//                       context: context,
//                       model: myData,
//                       currentPageData: {
//                         'name': myData.fullName,
//                         'email': myData.email,
//                         'phone': myData.phone,
//                         'password': myData.password,
//                         'confirm': confirmPasswordController.text.trim()
//                       },
//                       password: myData.password,
//                       confirmpassword: confirmPasswordController.text.trim(),
//                       NextScreen: farm_info(model: myData),
//                     );
//                   },
//                   width: 200,
//                 )
//               ],
//             ),
//             SizedBox(
//               height: 29,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
//
import 'package:flutter/material.dart';
import 'package:loginapp/features/auth/data/models/registermodel.dart';
import 'package:loginapp/features/auth/presentation/pages/Login/loginpage.dart';

import '../../shared/widgets/custombutton.dart';
import '../../shared/widgets/textfield.dart';
import '../../shared/widgets/titletext.dart';
import '../auth/application/buttonfunctoin.dart';
import 'farminfo.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  final fullNameController = TextEditingController();

  final emailController = TextEditingController();

  final phoneController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmPasswordController = TextEditingController();
  RegisterModel myData = RegisterModel();
  bool isloading = false;

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    // passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    // Get screen dimensions
    final size = MediaQuery.of(context).size;
    final double h = size.height;
    final double w = size.width;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: w * 0.08), // Proportional side padding
                  child: Column(
                    children: [
                      // Responsive Top Margin (scaled to 7% of screen height)
                      // SizedBox(height: h * 0.07),

                      const Customtext(
                          title: 'Welcome', uptext: 'Signup 1 of 4'),

                      SizedBox(height: h * 0.03),

                      // Social Icons Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Note: I removed fixed width/height so they scale inside the Row
                          _socialWrapper(w, 'assets/images/google.png'),
                          _socialWrapper(w, 'assets/images/apple.png'),
                          _socialWrapper(w, 'assets/images/facebook.png'),
                          _socialWrapper(w, 'assets/images/x.png'),
                        ],
                      ),

                      SizedBox(height: h * 0.025),
                      const Text(
                        'or sign up with',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),

                      SizedBox(height: h * 0.03),

                      // Text Fields with dynamic gaps (2% of screen height)
                      CustomField(
                        isPassword: false,
                        prefixIcon: Icons.person_outline,
                        controller: fullNameController,
                        hintText: 'Full Name',
                      ),
                      SizedBox(height: h * 0.02),

                      CustomField(
                          controller: emailController,
                          isPassword: false,
                          prefixIcon: Icons.alternate_email_rounded,
                          hintText: 'Email Address'),
                      SizedBox(height: h * 0.02),

                      CustomField(
                          controller: phoneController,
                          isPassword: false,
                          prefixIcon: Icons.phone_outlined,
                          hintText: 'Phone Number'),
                      SizedBox(height: h * 0.02),

                      CustomField(
                          controller: passwordController,
                          isPassword: true,
                          prefixIcon: Icons.lock_outline,
                          hintText: 'Password'),
                      SizedBox(height: h * 0.02),

                      CustomField(
                          controller: confirmPasswordController,
                          isPassword: true,
                          prefixIcon: Icons.lock_outline,
                          hintText: 'Re-enter Password'),

                      // Pushes the footer to the bottom regardless of screen height
                      const Spacer(),

                      // Footer Row
                      Padding(
                        padding: EdgeInsets.only(bottom: h * 0.04),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Loginpage()));
                                },
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            // Button width is 55% of screen width
                            SizedBox(
                              width: w * 0.55,
                              height: 52,
                              child: Custom_button(
                                btName: isloading ? 'Loading...' : 'Continue',
                                onTap: () {
                                  myData.fullName =
                                      fullNameController.text.trim();
                                  myData.email = emailController.text.trim();
                                  myData.phone = phoneController.text.trim();
                                  myData.password =
                                      passwordController.text.trim();
                                  // myData.confirmpassword: confirmPasswordController.text.trim();
                                  FromHandler.ValidateAndeNext(
                                    context: context,
                                    model: myData,
                                    currentPageData: {
                                      'name': myData.fullName,
                                      'email': myData.email,
                                      'phone': myData.phone,
                                      'password': myData.password,
                                      'confirm':
                                          confirmPasswordController.text.trim()
                                    },
                                    password: myData.password,
                                    confirmpassword:
                                        confirmPasswordController.text.trim(),
                                    NextScreen: farm_info(model: myData),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  // Helper to keep Social Buttons looking consistent across screens
  Widget _socialWrapper(double screenWidth, String imgPath) {
    return Container(
      width: screenWidth * 0.18, // Scaling width based on screen
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Image.asset(imgPath, width: 35),
      ),
    );
  }
}
