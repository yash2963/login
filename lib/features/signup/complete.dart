import 'package:flutter/material.dart';

import '../../shared/widgets/custombutton.dart';
import '../../shared/widgets/titletext.dart';
import '../auth/presentation/pages/Login/loginpage.dart';

class Complete extends StatelessWidget {
  const Complete({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                // Icon(Icons.check,size: 200,),
                SizedBox(
                  height: 100,
                ),
                Customtext(
                  isCenter: true,
                  title: 'You\'re all done!',
                  icon: Icon(
                    Icons.check_rounded,
                    size: 200,
                    color: Colors.green,
                  ),
                  subtext:
                      'Hang tight! We aer currently revviewing your account and will follow up you with in 2-3 business days in the meantime, you can setup your inventory',
                ),
                const Spacer(),
                Custom_button(
                  btName: 'Got it!',
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => Loginpage()),
                        (route) => false);
                  },
                ),
                SizedBox(
                  height: 30,
                )
              ],
            ),
          )),
        ),
      ),
    );
  }
}
