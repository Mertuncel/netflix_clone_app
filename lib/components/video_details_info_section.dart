import 'package:flutter/material.dart';

class InfoSection extends StatelessWidget {
  const InfoSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        textDesign(
            text: 'New',
            color: Colors.green[800],
            fontSize: 16,
            fontWeight: FontWeight.bold),
        const SizedBox(
          width: 20,
        ),
        textDesign(
            text: '2021',
            color: const Color.fromARGB(255, 101, 100, 100),
            fontSize: 16,
            fontWeight: FontWeight.bold),
        const SizedBox(
          width: 20,
        ),
        boxText(
            height: 20,
            width: 35,
            text: '18+',
            boxColor: const Color.fromARGB(255, 70, 70, 70),
            textColor: const Color.fromARGB(255, 234, 231, 231),
            fontSize: 13,
            fontWeight: FontWeight.bold),
        const SizedBox(
          width: 20,
        ),
        textDesign(
          text: '1 Season',
          fontSize: 20,
          color: const Color.fromARGB(255, 101, 100, 100),
        ),
        const SizedBox(
          width: 20,
        ),
        hdBox(),
      ],
    );
  }

  Widget hdBox() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        border: Border.all(
          color: Colors.white.withOpacity(0.2),
          width: 2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 6, right: 6, bottom: 4, top: 4),
        child: Text(
          'HD',
          style: TextStyle(
              color: Colors.white.withOpacity(0.5),
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Widget boxText(
      {String? text,
      Color? textColor,
      Color? boxColor,
      double? fontSize,
      FontWeight? fontWeight,
      double? height,
      double? width}) {
    return Container(
      height: height,
      width: width,
      color: boxColor,
      child: Center(
        child: Text(
          text!,
          style: TextStyle(
              color: textColor, fontSize: fontSize, fontWeight: fontWeight),
        ),
      ),
    );
  }

  Widget textDesign(
      {String? text, Color? color, double? fontSize, FontWeight? fontWeight}) {
    return Text(
      text ?? '',
      style:
          TextStyle(color: color, fontSize: fontSize, fontWeight: fontWeight),
    );
  }
}
