import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loginapp/features/auth/presentation/pages/Login/loginpage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../data/models/Onboardingdatamodel.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final PageController _controller = PageController();
  int _currentIndex = 0;
  Timer? _timer;
  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentIndex < pages.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0;
      }
      _controller.animateToPage(_currentIndex,
          duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final page = pages[_currentIndex];
    return Scaffold(
      backgroundColor: page.themeColor,
      body: Column(
        children: [
          SizedBox(
            height: 400,
            child: PageView.builder(
              controller: _controller,
              itemCount: pages.length,
              onPageChanged: (i) => setState(() => _currentIndex = i),
              itemBuilder: (_, i) => Image.asset(
                pages[i].ImagePath,
                width: double.infinity,
                height: 400,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Image.asset('assets/images/home2.png',
          //     width: double.infinity, height: 400, fit: BoxFit.cover),
          Expanded(
            // flex: 6,
            child: Container(
              width: double.infinity,
              // height: 500,
              margin: EdgeInsets.only(top: 15),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: Offset(0, 5))
                ],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
              ),
              child: Column(
                children: [
                  Center(
                      child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: Text(
                      page.title,
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                  )),
                  SizedBox(height: 25),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: Text(
                      page.description,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.8,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  SmoothPageIndicator(
                    controller: _controller,
                    count: pages.length,
                    effect: ExpandingDotsEffect(
                        dotColor: Colors.black,
                        dotHeight: 10,
                        dotWidth: 8,
                        activeDotColor: Colors.black),
                    onDotClicked: (i) => {
                      _controller.animateToPage(i,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut)
                    },
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Loginpage()));
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: page.themeColor,
                              minimumSize: Size(50, 50)),
                          child: Text(
                            'Join the movement!',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          )),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Loginpage()));
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 16,
                                decoration: TextDecoration.underline),
                          ))
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

//
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
//     // Get screen dimensions
//     final size = MediaQuery.of(context).size;
//     final double h = size.height;
//     final double w = size.width;
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Padding(
//         // Side padding is 8% of screen width
//         padding: EdgeInsets.symmetric(horizontal: w * 0.08),
//         child: Column(
//           children: [
//             // Top spacing (scaled to 8% of screen height)
//             SizedBox(height: h * 0.08),
//
//             Customtext(
//               title: 'Forgot Password?',
//               subtext: 'Remember your password? ',
//               actiontext: 'Login',
//             ),
//
//             // Gap between text and input
//             SizedBox(height: h * 0.04),
//
//             const CustomField(
//                 hintText: 'Phone Number',
//                 prefixIcon: Icons.phone_outlined,
//                 isPassword: false
//             ),
//
//             // Proportional gap (4% of screen height)
//             SizedBox(height: h * 0.04),
//
//             // Send Code Button
//             // Using a width of 100% (minus padding) or a specific percentage
//             SizedBox(
//               width: double.infinity,
//               height: 52, // Standard height for better touch targets
//               child: const Custom_button(btName: 'Send Code'),
//             ),
//
//             // If you want the button at the bottom, use Spacer() before it.
//             // If you want it grouped at the top, leave it as is.
//           ],
//         ),
//       ),
//     );
//   }
// }
