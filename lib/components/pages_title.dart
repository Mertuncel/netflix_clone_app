import 'package:flutter/material.dart';

class PagesTitle extends StatelessWidget {
  const PagesTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 28),
      ),
    );
  }
}
