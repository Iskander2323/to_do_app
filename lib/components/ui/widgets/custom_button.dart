import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.title,
      required this.onTap,
      this.color,
      this.width,
      this.height,
      this.textColor});

  final String title;
  final Color? color;
  final double? width;
  final double? height;
  final Color? textColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap,
      child: Container(
        width: width ?? double.infinity,
        height: height ?? 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: color ?? Colors.blue,
            borderRadius: BorderRadius.circular(15)),
        child: Text(
          title,
          style: TextStyle(color: textColor ?? Colors.white, fontSize: 22),
        ),
      ),
    );
  }
}
