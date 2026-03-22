import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loginapp/features/auth/application/provider/auth_provider.dart';
import 'package:loginapp/features/auth/presentation/pages/Login/homepage.dart';
import 'package:loginapp/features/signup/welcomepage.dart';

import '../../../../../shared/widgets/custombutton.dart';
import '../../../../../shared/widgets/socialicon.dart';
import '../../../../../shared/widgets/textfield.dart';
import '../../../../../shared/widgets/titletext.dart';
import 'forgotpassword.dart';

// final LoginApiProvider = Provider((_) => Api());

class Loginpage extends ConsumerWidget {
  // Loginpage({super.key});

  // @override
  // State<Loginpage> createState() => _LoginpageState();
// }

// class _LoginpageState extends State<Loginpage> {
//   final Logincontroller _controller = Logincontroller();

  final TextEditingController _emailRef = TextEditingController();

  final TextEditingController _passRef = TextEditingController();

  @override
  // bool _isLoading = false;
  // Ye define karna zaroori hai
  Widget build(BuildContext context, WidgetRef ref) {
    final loginstate = ref.watch(loginProvider);
    ref.listen(loginProvider, (previous, next) {
      if (next.isSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Login Successful!"),
          backgroundColor: Colors.green,
        ));
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Homepage()));
      }
      if (next.errorMessage != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.errorMessage!),
            backgroundColor: Colors.red,
          ),
        );
      }
    });
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              Customtext(
                title: 'Welcome back!',
                subtext: 'Now here? ',
                actiontext: 'Create account',
                onActionTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WelcomePage()));
                },
              )
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.start,
              // children: [
              //   SizedBox(height: 60,),
              //   Text('FarmerEats',style: TextStyle(fontSize: 19,fontWeight: FontWeight.w500),),
              //   SizedBox(height: 80,),
              //   Text('Welcome Back!',style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
              //   SizedBox(height: 6,),
              //   Row(
              //     children: [Text('Now here ?',style: TextStyle(fontSize: 16,color: Colors.grey),),
              //     TextButton(onPressed: (){}, child: Text('Create account',style: TextStyle(fontSize: 16,color: Colors.redAccent),))],
              //   ),
              ,
              SizedBox(
                height: 40,
              ),
              // TextField(
              //   decoration: InputDecoration(
              //     prefixIcon: Icon(Icons.alternate_email,),
              //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none),
              //     hintText: 'Email Address',
              //     filled: true,
              //   ),
              // ),
              CustomField(
                  controller: _emailRef,
                  hintText: 'Email Address',
                  prefixIcon: Icons.alternate_email_rounded,
                  isPassword: false),
              SizedBox(
                height: 27,
              ),
              // TextField(
              //   decoration: InputDecoration(
              //     prefixIcon: Icon(Icons.lock_outline,),
              //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none),
              //     hintText: 'Password',
              //     suffix: Text('Forgot?',style: TextStyle(color: Colors.red),),
              //     filled: true,
              //   ),
              // ),
              // made a custom text feild that is more clean and it help to rewrite code very fast after making a custom text field widget code readability also increase
              CustomField(
                controller: _passRef,
                hintText: 'Password',
                prefixIcon: Icons.lock_outline,
                isPassword: true,
                suffixWidget: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Password(),
                        ));
                  },
                  child: Text(
                    'forgot?',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),

              SizedBox(
                height: 32,
              ),
              Custom_button(
                btName: loginstate.isLoading ? 'Loading .....' : 'Login',
                onTap: loginstate.isLoading
                    ? null
                    : () {
                        if (_emailRef.text.isEmpty || _passRef.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Please fill all fields"),
                          ));
                          return;
                        }
                        ref
                            .read(loginProvider.notifier)
                            .handleLogin(_emailRef.text, _passRef.text);
                      },
              ),
              // Center(child: ElevatedButton(onPressed: (){},
              //   child: Text('Login',style: TextStyle(fontSize: 20,color: Colors.white),),
              //   style: ElevatedButton.styleFrom(backgroundColor: Colors.red,minimumSize: Size(double.infinity, 55)),)),
              SizedBox(
                height: 30,
              ),
              Center(
                  child: const Text(
                'or login with',
                style: TextStyle(color: Colors.grey),
              )),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // ElevatedButton(onPressed: (){},
                  //   child: Image.asset('assets/images/google.png',),
                  //   // style: ElevatedButton.styleFrom(minimumSize: Size(10, 20)),
                  // ),
                  // make a reusabel elevated because it is repated may times and that save times or it makes code more clean and increase it's readablity
                  CustomButton(
                      width: 40,
                      height: 40,
                      image: 'assets/images/google.png',
                      imagewidth: 35),
                  CustomButton(
                    height: 40,
                    width: 40,
                    image: 'assets/images/apple.png',
                    imageheight: 35,
                  ),
                  CustomButton(
                    width: 40,
                    height: 40,
                    image: 'assets/images/facebook.png',
                    imageheight: 35,
                  ),
                  CustomButton(
                    width: 40,
                    height: 40,
                    image: 'assets/images/x.png',
                    imageheight: 35,
                  )
                  // ElevatedButton(onPressed: (){}, child: Image.asset('assets/images/facebook.png')),
                  // ElevatedButton(onPressed: (){}, child: Image.asset('assets/images/x.png')),
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
