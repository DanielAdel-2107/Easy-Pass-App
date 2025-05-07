import 'package:flutter/material.dart';

class TripleBottomWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint1 = Paint()..color = Colors.black87;
    Paint paint2 = Paint()..color = Colors.white.withOpacity(0.3);
    Path path1 = Path();
    path1.lineTo(0, size.height * 0.7);
    path1.quadraticBezierTo(size.width * 0.2, size.height * 1.1,
        size.width * 0.5, size.height * 0.8);
    path1.quadraticBezierTo(
        size.width * 0.8, size.height * 0.5, size.width, size.height * 0.8);
    path1.lineTo(size.width, 0);
    path1.close();
    Path path2 = Path();
    path2.lineTo(0, size.height * 0.6);
    path2.quadraticBezierTo(size.width * 0.2, size.height * 1.0,
        size.width * 0.5, size.height * 0.7);
    path2.quadraticBezierTo(
        size.width * 0.8, size.height * 0.4, size.width, size.height * 0.8);
    path2.lineTo(size.width, 0);
    path2.close();
    canvas.drawPath(path1, paint1);
    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
