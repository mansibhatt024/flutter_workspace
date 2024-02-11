import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:ui';

import 'package:flutter/material.dart';

class SignaturePadWidget extends StatefulWidget {
  final SignaturePadController controller;
  final double height;
  final Color backgroundColor;

  const SignaturePadWidget({
    Key? key,
    required this.controller,
    required this.height,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  SignaturePadWidgetState createState() => SignaturePadWidgetState();
}

class SignaturePadWidgetState extends State<SignaturePadWidget> {
  final List<Offset> points = <Offset>[];

  get painter => null;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          RenderBox renderBox = context.findRenderObject() as RenderBox;
          points.add(renderBox.globalToLocal(details.globalPosition));
        });
      },
      onPanEnd: (details) => points.add(Offset(-1, -1)),
      child: CustomPaint(
        painter: SignaturePadPainter(points, widget.backgroundColor),
        size: Size(200, widget.height),
      ),
    );
  }
}
class SignaturePadController {
  final GlobalKey<SignaturePadWidgetState> _signaturePadKey = GlobalKey();

  Future<Uint8List?> toPngBytes() async {
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);
    await _signaturePadKey.currentState?.painter.paint(canvas, Size(200, 200));
    final picture = recorder.endRecording();
    final img = await picture.toImage(200, 200);
    final byteData = await img.toByteData(format: ui.ImageByteFormat.png);

    return byteData?.buffer.asUint8List();
  }
}
class SignaturePadPainter extends CustomPainter {
  final List<Offset> points;
  final Color backgroundColor;
  final Paint pen = Paint()
    ..color = Colors.black
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 5.0;

  SignaturePadPainter(this.points, this.backgroundColor);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paintBackground = Paint()..color = backgroundColor;
    Rect rect = Rect.fromPoints(Offset(0, 0), Offset(size.width, size.height));
    canvas.drawRect(rect, paintBackground);

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i]!, points[i + 1]!, pen);
      } else if (points[i] != null && points[i + 1] == null) {
        canvas.drawPoints(PointMode.points, [points[i]!], pen);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
