import 'package:flutter/material.dart';

class BottomNavShadowPainter extends CustomPainter {
  Color backgroundColor;
  Color shadowColor;
  double elevation; 

  BottomNavShadowPainter({
    this.backgroundColor = Colors.transparent,
    this.shadowColor = Colors.black45,
    this.elevation = 4
  });


  @override
  void paint(Canvas canvas, Size size) {

    Paint paint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;
    Path path = Path();
    path.moveTo(size.width, size.height - 70);
    path.lineTo(size.width, size.height);

    path.lineTo(0, size.height);
    path.lineTo(0, size.height - 70);
    //+56 here extends the navbar below app bar to include extra space on some screens (iphone 11)
    canvas.drawShadow(path, shadowColor, elevation, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
