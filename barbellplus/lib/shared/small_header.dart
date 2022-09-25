import 'package:flutter/material.dart';

class SmallAppHeader extends StatelessWidget {
  final String title;

  const SmallAppHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: Stack(children: [
        CustomPaint(
          size: const Size(double.infinity, 100),
          painter: HeaderPainter(),
        ),
        Positioned(
          top: 34,
          left: 10,
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon:
                const Icon(Icons.arrow_back_ios, color: Colors.white, size: 15),
          ),
        ),
        Positioned(
          top: 45,
          left: 65,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 20,
                )),
          ]),
        )
      ]),
    );
  }
}

class HeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint background = Paint()..color = const Color.fromARGB(255, 209, 5, 5);
    Paint circles = Paint()
      ..color = const Color.fromARGB(255, 117, 117, 117).withAlpha(90);

    canvas.drawRect(
      Rect.fromPoints(
        const Offset(0, 0),
        Offset(size.width, size.height),
      ),
      background,
    );

    canvas.drawCircle(Offset(size.width * 0.65, 10), 30, circles);
    canvas.drawCircle(Offset(size.width * 0.60, 86), 10, circles);
    canvas.drawCircle(Offset(size.width - 10, 65), 20, circles);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
