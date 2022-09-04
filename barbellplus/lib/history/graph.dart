import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class Graph extends StatelessWidget {
  const Graph({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
        child: SizedBox(
      width: double.infinity,
      child: GraphArea(),
    ));
  }
}

class GraphArea extends StatefulWidget {
  const GraphArea({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _GraphAreaState createState() => _GraphAreaState();
}

class _GraphAreaState extends State<GraphArea>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  List<DataPoint> data = [
    DataPoint(day: 1, load: Random().nextInt(1000)),
    DataPoint(day: 2, load: Random().nextInt(1000)),
    DataPoint(day: 3, load: Random().nextInt(1000)),
    DataPoint(day: 4, load: Random().nextInt(1000)),
    DataPoint(day: 5, load: Random().nextInt(1000)),
    DataPoint(day: 6, load: Random().nextInt(1000)),
    DataPoint(day: 7, load: Random().nextInt(1000)),
    DataPoint(day: 8, load: Random().nextInt(1000)),
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: GraphPainter(_animationController.view, data: data),
    );
  }
}

class GraphPainter extends CustomPainter {
  final List<DataPoint> data;
  final Animation<double> _size;
  final Animation<double> _dotSize;

  GraphPainter(Animation<double> animation, {required this.data})
      : _size = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
            parent: animation, curve: Curves.easeInOutCubicEmphasized)),
        _dotSize = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
            parent: animation, curve: Curves.easeInOutCubicEmphasized)),
        super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    var xSpacing = size.width / (data.length - 1);

    var maxLoad = data
        .fold<DataPoint>(data[0],
            (prev, current) => prev.load > current.load ? prev : current)
        .load;

    var yRatio = size.height / maxLoad;
    var curveOffset = xSpacing * 0.3;

    List<Offset> offsets = [];

    var currentX = 0.0;
    for (int i = 0; i < data.length; i++) {
      var y = size.height - (data[i].load * yRatio * _size.value);
      offsets.add(Offset(currentX, y));
      currentX += xSpacing;
    }

    Paint linePaint = Paint()
      ..color = const Color.fromARGB(255, 209, 5, 5)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    Paint shadowPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..maskFilter = const MaskFilter.blur(ui.BlurStyle.solid, 1);

    Paint fillPaint = Paint()
      ..shader = ui.Gradient.linear(
          Offset(size.width / 2, 0),
          Offset(size.width / 2, size.height),
          [const Color.fromARGB(255, 209, 5, 5), Colors.white])
      ..style = PaintingStyle.fill;

    Paint dotOutlinePaint = Paint()
      ..color = Colors.white.withAlpha(200)
      ..strokeWidth = 9;

    Paint dotCenter = Paint()
      ..color = const Color.fromARGB(255, 209, 5, 5)
      ..strokeWidth = 8;

    Path linePath = Path();

    Offset currentOffset = offsets[0];

    linePath.moveTo(currentOffset.dx, currentOffset.dy);

    for (int i = 1; i < offsets.length; i++) {
      var x = offsets[i].dx;
      var y = offsets[i].dy;
      var c1x = currentOffset.dx + curveOffset;
      var c1y = currentOffset.dy;
      var c2x = x - curveOffset;
      var c2y = y;

      linePath.cubicTo(c1x, c1y, c2x, c2y, x, y);
      currentOffset = offsets[i];
    }

    Path fillPath = Path.from(linePath);
    fillPath.lineTo(size.width, size.height);
    fillPath.lineTo(0, size.height);

    canvas.drawPath(fillPath, fillPaint);
    canvas.drawPath(linePath, shadowPaint);
    canvas.drawPath(linePath, linePaint);

    canvas.drawCircle(offsets[4], 15 * _dotSize.value, dotOutlinePaint);
    canvas.drawCircle(offsets[4], 6 * _dotSize.value, dotCenter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class DataPoint {
  final int day;
  final int load;

  DataPoint({required this.day, required this.load});
}
