import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Wallpaper',
          style: TextStyle(color: Colors.black),
        ),
        Text(
          'Hub',
          style: TextStyle(color: Colors.orange),
        ),
      ],
    );
  }
}
