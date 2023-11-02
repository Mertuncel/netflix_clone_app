
// ignore_for_file: file_names

import 'package:flutter/material.dart';

class LogoIcons extends StatelessWidget {
  const LogoIcons({
    Key? key,
    this.logoImg,
  }) : super(key: key);

  final String? logoImg;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Image.asset(
            'assets/images/logo.ico',
            width: 35,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}

