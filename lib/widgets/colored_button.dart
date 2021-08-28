import 'package:flutter/material.dart';

class ColoredButton extends StatelessWidget {
  const ColoredButton({
    required this.buttonText,
    required this.color,
    required this.onPressed,
    this.padding = const EdgeInsets.all(0),
    this.enabledShadow = true,
    this.fontSize = 16,
    Key? key,
  }) : super(key: key);

  final String buttonText;
  final Color color;
  final EdgeInsetsGeometry padding;
  final VoidCallback onPressed;
  final bool enabledShadow;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: color),
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(color: Color(0x20000000), spreadRadius: 0.4, blurRadius: 4),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
          child: Padding(
            padding: padding,
            child: Text(
              buttonText,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: fontSize),
            ),
          ),
        ),
      ),
    );
  }
}
