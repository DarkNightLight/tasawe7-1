// ignore_for_file: library_prefixes, file_names

import 'package:flutter/material.dart';
import 'package:Tasawe7/services/color.dart' as AppColor;



class Painter1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
   
    Paint paint_1 = Paint()
      ..color = Color.fromRGBO(236, 236, 254, 1)
      ..style = PaintingStyle.fill;

    Path path_1 = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width * 0.1, 0)
      ..cubicTo(size.width * .05, 0, 0, 20, 0, size.width * .08);

    Path path_2 = Path()
      ..moveTo(size.width, 0)
      ..lineTo(size.width * .9, 0)
      ..cubicTo(
          size.width * .95, 0, size.width, 20, size.width, size.width * .08);

    Paint paint_2 = Paint()
      ..color = AppColor.ColorAppBarBackGraound
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    Path path_3 = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0);

    canvas.drawPath(path_1, paint_1);
    canvas.drawPath(path_2, paint_1);
    canvas.drawPath(path_3, paint_2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}








class Painter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
   
    Paint paint_1 = Paint()
      ..color = AppColor.ColorAppBarBackGraoundB
      ..style = PaintingStyle.fill;

    Path path_1 = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width * 0.1, 0)
      ..cubicTo(size.width * .05, 0, 0, 20, 0, size.width * .08);

    Path path_2 = Path()
      ..moveTo(size.width, 0)
      ..lineTo(size.width * .9, 0)
      ..cubicTo(
          size.width * .95, 0, size.width, 20, size.width, size.width * .08);

    Paint paint_2 = Paint()
      ..color = AppColor.ColorAppBarBackGraoundB
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    Path path_3 = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0);

    canvas.drawPath(path_1, paint_1);
    canvas.drawPath(path_2, paint_1);
    canvas.drawPath(path_3, paint_2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}








// class Painter3 extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
   
//     Paint paint_1 = Paint()
//       ..color = AppColor.ColorAppBarBackGraoundB
//       ..style = PaintingStyle.fill;

//     Path path_1 = Path()
//       ..moveTo(0, 0)
//       ..lineTo(size.width * .6, 0)
//       ..cubicTo(size.width * .05, 10, 0, 19, -1, size.width * .2);

//     Path path_2 = Path()
//       ..moveTo(size.width, 0)
//       ..lineTo(size.width * .4, 0)
//       ..cubicTo(
//           size.width * .95, 10, size.width, 20, size.width, size.width * .2);

//     Paint paint_2 = Paint()
//       ..color =  AppColor.ColorAppBarBackGraoundB
//       ..strokeWidth = 5
//       ..style = PaintingStyle.stroke;

//     Path path_3 = Path()
//       ..moveTo(0, 0)
//       ..lineTo(size.width, 0);

//     canvas.drawPath(path_1, paint_1);
//     canvas.drawPath(path_2, paint_1);
//     canvas.drawPath(path_3, paint_2);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }