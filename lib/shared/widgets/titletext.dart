import 'package:flutter/material.dart';

class Customtext extends StatelessWidget {
  const Customtext(
      {super.key,
      required this.title,
      this.subtext,
      this.actiontext,
      this.onActionTap,
      this.uptext,
      this.icon,
      this.isCenter});

  @override
  final String title;
  final Icon? icon;
  final String? subtext;
  final String? actiontext;
  final VoidCallback? onActionTap;
  final String? uptext;
  final bool? isCenter;
  Widget build(BuildContext context) {
    final bool center = isCenter ?? false;
    final CrossAxisAlignment alignment =
        center ? CrossAxisAlignment.center : CrossAxisAlignment.start;
    final TextAlign textalignment = center ? TextAlign.center : TextAlign.start;
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: alignment,
        // CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 50,
          ),
          if (icon != null)
            isCenter! ? Center(child: icon!) : icon!
          else
            const Text(
              'FarmerEats',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          SizedBox(
            height: uptext == null ? 40 : 0,
          ),
          if (uptext != null) ...[
            Text(
              uptext!,
              textAlign: textalignment,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(
              height: 8,
            ),
          ],
          center
              ? Center(
                  child: Text(
                    title,
                    textAlign: textalignment,
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -0.5),
                  ),
                )
              : Text(
                  title,
                  textAlign: textalignment,
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
          SizedBox(
            height: subtext != null ? 15 : 0,
          ),
          if (subtext != null)
            // const SizedBox(height: 15,),
            Text.rich(
                textAlign: textalignment,
                TextSpan(children: [
                  TextSpan(
                    text: subtext!,
                    style: const TextStyle(
                        fontSize: 14, color: Colors.grey, height: 1.5),
                  ),
                  if (actiontext != null)
                    WidgetSpan(
                      child: GestureDetector(
                        onTap: onActionTap,
                        child: Text(
                          '$actiontext',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.redAccent,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                ])),
          SizedBox(height: uptext != null ? 0 : 50)
        ],
      ),
    );
  }
}
