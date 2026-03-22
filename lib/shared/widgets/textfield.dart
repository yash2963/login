import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomField extends StatelessWidget {
  const CustomField({
    super.key,
    this.hintText,
    this.prefixIcon,
    this.suffixWidget,
    required this.isPassword,
    this.controller,
    this.width,
    this.textAlign = TextAlign.start,
    this.KeyboardType = TextInputType.text,
    this.inputFormatters,
    this.onChanged,
  });

  @override
  final String? hintText;
  final IconData? prefixIcon;
  final Widget? suffixWidget;
  final bool isPassword;
  // final double? height;
  final double? width;
  final TextAlign textAlign;
  final TextInputType? KeyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;

  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        textAlign: textAlign,
        keyboardType: KeyboardType,
        onChanged: onChanged,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFE4E4E4),
            prefixIcon: prefixIcon != null
                ? Icon(
                    prefixIcon,
                    color: Colors.black54,
                  )
                : null,
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            suffix: suffixWidget,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none),
            contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 15)),
      ),
    );
    SizedBox();
  }
}

// decoration: InputDecoration(
// prefixIcon: Icon(Icons.lock_outline,),
// border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none),
// hintText: 'Password',
// suffix: Text('Forgot?',style: TextStyle(color: Colors.red),),
// filled: true, required fillColor, required fillColor,
