import 'package:flutter/material.dart';

class LinearBox extends StatelessWidget {
  final double height;
  const LinearBox({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.transparent, Colors.black],
        ),
      ),
    );
  }
}
