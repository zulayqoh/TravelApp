import 'package:flutter/material.dart';

class CircularTabIndicator extends Decoration {
  final Color color;
  final double radius;

  const CircularTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  final double radius;

  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Offset circleOffset = Offset(configuration.size!.width/2, configuration.size!.height);
    final Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;
    
    canvas.drawCircle(offset+ circleOffset, radius, paint);
  }
}
