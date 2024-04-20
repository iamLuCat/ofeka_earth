import 'package:flutter/material.dart';

class DiagonalPathClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0.0, 0.0)
      ..relativeLineTo(size.width, size.height)
      ..lineTo(0.0, size.height)
      ..lineTo(0.0, 0.0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
