import 'package:flutter/material.dart';
import 'package:newapexproject/constant.dart';

class Shapes extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    Paint paint0 = Paint()
      ..color = K.mainColor
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;


    Path path0 = Path();
    path0.moveTo(0,size.height*0.0060000);
    path0.lineTo(size.width*0.9979125,size.height*0.0046600);
    path0.lineTo(size.width,size.height*0.5993400);
    path0.quadraticBezierTo(size.width*0.9538375,size.height*0.7897600,size.width*0.8125000,size.height*0.7920000);
    path0.cubicTo(size.width*0.6412500,size.height*0.7945000,size.width*0.2987500,size.height*0.7995000,size.width*0.1275000,size.height*0.8020000);
    path0.quadraticBezierTo(size.width*0.0419750,size.height*0.8037400,size.width*0.0025000,size.height*0.9960000);
    path0.lineTo(0,size.height*0.0060000);
    path0.close();

    canvas.drawPath(path0, paint0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
