import 'package:diagram_editor/src/utils/link_style.dart';
import 'package:diagram_editor/src/utils/vector_utils.dart';
import 'package:flutter/material.dart';

class LinkPainter extends CustomPainter {
  final List<Offset> linkPoints;
  final double scale;
  final LinkStyle linkStyle;

  LinkPainter({
    required this.linkPoints,
    required this.scale,
    required this.linkStyle,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = linkStyle.color
      ..strokeWidth = linkStyle.lineWidth * scale
      ..style = PaintingStyle.stroke;

// ---------------------------------- 곡선일뻔한 부분
    // Path path = Path();

    // path.moveTo(linkPoints[0].dx, linkPoints[0].dy);

    // path.quadraticBezierTo(
    //     linkPoints[1].dx, linkPoints[1].dy, linkPoints[2].dx, linkPoints[2].dy);

    // path.lineTo(linkPoints[3].dx, linkPoints[3].dy);

    // for (int i = 4; i < linkPoints.length; i++) {
    //   path.lineTo(linkPoints[i].dx, linkPoints[i].dy);
    // }

    // canvas.drawPath(path, paint);

    for (int i = 0; i < linkPoints.length - 1; i++) {
      if (linkPoints.length == 2) {
        // 직선
        canvas.drawPath(
          linkStyle.getLinePath(
            VectorUtils.getShorterLineStart(
              linkPoints[i],
              linkPoints[i + 1],
              scale * linkStyle.getEndShortening(linkStyle.backArrowType),
            ),
            VectorUtils.getShorterLineEnd(
              linkPoints[i],
              linkPoints[i + 1],
              scale * linkStyle.getEndShortening(linkStyle.arrowType),
            ),
            scale,
          ),
          paint,
        );
      } else if (i == 0) {
        // startpoint
        canvas.drawPath(
          linkStyle.getLinePath(
            VectorUtils.getShorterLineStart(
              linkPoints[i],
              linkPoints[i + 1],
              scale * linkStyle.getEndShortening(linkStyle.backArrowType),
            ),
            linkPoints[i + 1],
            scale,
          ),
          paint,
        );
      } else if (i == linkPoints.length - 2) {
        // endpoint
        canvas.drawPath(
          linkStyle.getLinePath(
            linkPoints[i],
            VectorUtils.getShorterLineEnd(
              linkPoints[i],
              linkPoints[i + 1],
              scale * linkStyle.getEndShortening(linkStyle.arrowType),
            ),
            scale,
          ),
          paint,
        );
      } else {
        // middle
        canvas.drawPath(
            linkStyle.getLinePath(linkPoints[i], linkPoints[i + 1], scale),
            paint);
      }
    }

    paint..style = PaintingStyle.fill;
    canvas.drawPath(
        linkStyle.getArrowTipPath(
          linkStyle.arrowType,
          linkStyle.arrowSize,
          linkPoints[linkPoints.length - 2],
          linkPoints[linkPoints.length - 1],
          scale,
        ),
        paint);

    canvas.drawPath(
        linkStyle.getArrowTipPath(
          linkStyle.backArrowType,
          linkStyle.backArrowSize,
          linkPoints[1],
          linkPoints[0],
          scale,
        ),
        paint);

    // DEBUG:
    // paint
    //   ..color = Colors.green
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = scale * 0.2;
    // canvas.drawPath(
    //     makeWiderLinePath(scale * (5 + linkStyle.lineWidth)), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

  @override
  bool hitTest(Offset position) {
    Path path = makeWiderLinePath(scale * (5 + linkStyle.lineWidth));
    return path.contains(position);
  }

  Path makeWiderLinePath(double hitAreaWidth) {
    Path path = new Path();
    for (int i = 0; i < linkPoints.length - 1; i++) {
      var point1 = linkPoints[i];
      var point2 = linkPoints[i + 1];

      // if (i == 0)
      //   point1 = PainterUtils.getShorterLineStart(point1, point2, scale * 10);
      // if (i == linkPoints.length - 2)
      //   point2 = PainterUtils.getShorterLineEnd(point1, point2, scale * 10);

      path.addPath(VectorUtils.getRectAroundLine(point1, point2, hitAreaWidth),
          Offset(0, 0));
    }
    return path;
  }
}
