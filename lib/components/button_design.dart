import 'package:flutter/material.dart';

class ButtonDesign extends StatelessWidget {
  const ButtonDesign({
    super.key,
    required this.text,
    required this.icon,
    required this.color,
    required this.press,
    required this.textColor, required this.iconColor,
  });

  final String text;
  final IconData icon;
  final Color color;
  final Color iconColor;
  final Color textColor;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style:  ButtonStyle(
          backgroundColor: MaterialStatePropertyAll<Color>(color)),
      onPressed: press,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: 45,
              child: Icon(
                icon,
                size: 25,
                color: iconColor,
              )),
          const SizedBox(
            width: 5,
          ),
          Text(
            text,
            style: TextStyle(
                fontSize: 18, color: textColor, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
