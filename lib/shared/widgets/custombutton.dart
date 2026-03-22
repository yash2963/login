import 'package:flutter/material.dart';

class Custom_button extends StatelessWidget {
  const Custom_button(
      {super.key, required this.btName, this.width, this.onTap});
  final String btName;
  final double? width;
  final VoidCallback? onTap;
// final double w = size.width;
  @override
  Widget build(BuildContext context) {
    // width: width ?? double.infinity;
    // double ? btnWidth = isFullWidth ? double.infinity:200.0;
    return SizedBox(
        width: width ?? double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: onTap,
          child: Text(
            btName,
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            // minimumSize: Size(double.infinity, 55)),
          ),
        ));
  }
}
//
// SizedBox(height: 32,),
// Center(child: ElevatedButton(onPressed: (){},
// child: Text('Login',style: TextStyle(fontSize: 20,color: Colors.white),),
// style: ElevatedButton.styleFrom(backgroundColor: Colors.red,minimumSize: Size(double.infinity, 55)),)),
