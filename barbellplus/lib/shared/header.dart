import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: Stack(children: [
        CustomPaint(
          size: const Size(double.infinity, 200),
          painter: HeaderPainter(),
        ),
        Positioned(
          top: 20,
          left: 20,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu, color: Colors.white),
          ),
        ),
        const Positioned(
          bottom: 22,
          right: 40,
          child: CircleAvatar(
            minRadius: 45,
            maxRadius: 45,
            foregroundImage: AssetImage('assets/images/profile.png'),
          ),
        ),
        Positioned(
          left: 33,
          bottom: 22,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Hello",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 20,
                    )),
                Text("John Doe",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
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
    canvas.drawCircle(Offset(size.width * 0.60, 130), 10, circles);
    canvas.drawCircle(Offset(size.width - 10, size.height - 10), 20, circles);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
