import 'package:flutter/material.dart';

class ProfileAndIcon extends StatelessWidget {
  const ProfileAndIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.collections_bookmark,
            size: 26,
            color: Colors.white,
          ),
        ),
        IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/images/profile.jpeg',
              width: 26,
              fit: BoxFit.cover,
            ))
      ],
    );
  }
}
