import 'package:flutter/material.dart';

class TextDesign extends StatelessWidget {
  const TextDesign({
    super.key,
    required this.text,
    required this.color,
    required this.fontsize,
    this.fontWeight, this.textHeight,
  });

  final String text;
  final Color color;
  final double fontsize;
  final FontWeight? fontWeight;
  final double? textHeight;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(
              color: color, fontSize: fontsize, fontWeight: fontWeight, height: textHeight ),
        ),
      ],
    );
  }
}
