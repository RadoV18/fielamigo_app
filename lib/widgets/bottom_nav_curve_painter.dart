import 'package:flutter/material.dart';

class BottomNavCurvePainter extends CustomPainter {
  Color backgroundColor;
  Color shadowColor;
  double elevation; 
  double insetRadius;

  BottomNavCurvePainter({
    this.backgroundColor = Colors.white,
    this.insetRadius = 38,
    this.shadowColor = Colors.grey,
    this.elevation = 100
  });


  @override
  void paint(Canvas canvas, Size size) {

    Paint paint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;
    Path path = Path();

    double insetCurveBeginnningX = size.width / 2 - insetRadius;
    double insetCurveEndX = size.width / 2 + insetRadius;
   
    path.lineTo(insetCurveBeginnningX, 0);
    path.arcToPoint(Offset(insetCurveEndX, 0),
        radius: const Radius.circular(41), clockwise: true);
   
    path.lineTo(size.width, 0);

    path.lineTo(size.width, size.height + 56);
    path.lineTo(
        0,
        size.height +
            56); //+56 here extends the navbar below app bar to include extra space on some screens (iphone 11)
    canvas.drawShadow(path, shadowColor, elevation, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
