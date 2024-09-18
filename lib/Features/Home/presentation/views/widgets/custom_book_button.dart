import 'package:bookapp/Core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomBookButton extends StatelessWidget {
  const CustomBookButton({super.key, required this.text,  this.backgroundColor,  this.textColor,  this.fontSize,  this.borderRadius, this.onPressed});

   final String text;
   final Color? backgroundColor;
   final Color? textColor;
   final double? fontSize;
   final BorderRadius? borderRadius;
   final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(borderRadius: borderRadius ?? BorderRadius.circular(12))
        ),
        child: 
      Text(
        text, 
        style: Styles.textStyle18lora.copyWith(color: textColor,fontSize: fontSize),
      )
      ),
    );
  }
}