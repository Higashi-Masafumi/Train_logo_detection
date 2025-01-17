import 'package:flutter/material.dart';

class TrainLineLogo extends StatelessWidget {
  final Color circleColor;
  final String text;
  final double size;
  final String? subText; // サブテキストをオプションに変更

  const TrainLineLogo({
    super.key,
    required this.circleColor,
    required this.text,
    required this.size,
    this.subText,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: TrainLineLogoPainter(circleColor, text, subText),
    );
  }
}

class TrainLineLogoPainter extends CustomPainter {
  final Color circleColor;
  final String text;
  final String? subText;

  TrainLineLogoPainter(this.circleColor, this.text, this.subText);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = circleColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width / 6; // 円環部分を太く調整

    // Draw outer ring (color)
    canvas.drawCircle(size.center(Offset.zero), size.width / 2.5, paint);

    // Draw inner white circle
    final Paint innerPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    canvas.drawCircle(size.center(Offset.zero), size.width / 3, innerPaint);

    // Draw main text
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          color: Colors.black,
          fontSize: subText == null
              ? size.width / 2.5
              : size.width / 3, // サブテキストがない場合、フォントサイズを大きく
          fontWeight: FontWeight.bold,
        ),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();

    final double mainTextY = subText == null
        ? size.height / 2 - textPainter.height / 2 // サブテキストがない場合は中央
        : size.height / 3 - textPainter.height / 2; // サブテキストがある場合は上寄り

    textPainter.paint(
      canvas,
      Offset(
        size.width / 2 - textPainter.width / 2,
        mainTextY,
      ),
    );

    // Draw subtext only if provided
    if (subText != null && subText!.isNotEmpty) {
      final TextPainter subTextPainter = TextPainter(
        text: TextSpan(
          text: subText,
          style: TextStyle(
            color: Colors.black,
            fontSize: size.width / 4,
            fontWeight: FontWeight.bold,
          ),
        ),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );
      subTextPainter.layout();
      subTextPainter.paint(
        canvas,
        Offset(
          size.width / 2 - subTextPainter.width / 2,
          size.height / 2 + textPainter.height / 8,
        ),
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
