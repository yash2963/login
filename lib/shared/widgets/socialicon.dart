import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key,
    required this.width,
    required this.height,
    this.imageheight,
    this.imagewidth,
    this.btName,
    this.image,
    this.bgColor = Colors.white,
    this.textStyle,
    this.callback}): assert(
  btName != null || image != null,
  "Either btName or image must be provided"
  );
  final String? btName;
  // final Icon? icon;
  final String? image;
  final TextStyle? textStyle;
  final VoidCallback? callback;
  final Color? bgColor;
  final double width;
  final double height;
  final double? imagewidth;
  final double? imageheight;


  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(constraints: BoxConstraints(
      minHeight: height,
      minWidth: width,
    ),
      child: ElevatedButton(onPressed: (){callback!();
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white
        // elevation: 4,
        // minimumSize: Size(width ,heigth),
        //   shadowColor: bgColor
      );},
      child:Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          if(image != null) Image.asset(
            image!,
            height: imageheight,
            width: imagewidth,
            fit: BoxFit.contain,
          ),
          if(image != null && btName != null)
            const SizedBox(width: 8,),
          if (btName != null)Text(btName!,style: textStyle,)
        ],
      ),
      // Text(btName,style: textStyle,),

      // ),
    ),
    );

  }
}
