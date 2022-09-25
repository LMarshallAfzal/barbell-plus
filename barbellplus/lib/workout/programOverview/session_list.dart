import 'package:barbellplus/services/firestore.dart';
import 'package:barbellplus/services/models.dart';
import 'package:flutter/material.dart';

// A list of sessions which are in the program
class SessionList extends StatelessWidget {
  const SessionList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Workout>(
      future: FirestoreService()
          .getWorkout('kcl-barbell-program-leonard-basic-strength-v1'),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
                color: Color.fromARGB(255, 209, 5, 5)),
          );
        }
        return SizedBox(
          width: double.infinity,
          height: 481,
          child: Expanded(
            child: CustomPaint(
              painter: SessionListPainter(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data?.numberOfSessions,
                      itemBuilder: (context, index) => SessionItem(
                        session: snapshot.data!.sessions[index],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

//Session list painter so that we can add a custom paint background should be of type CustomPainter
class SessionListPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey[200]!
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..lineTo(0, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class SessionItem extends StatelessWidget {
  final WorkoutSession session;

  // ignore: prefer_const_constructors_in_immutables
  SessionItem({super.key, required this.session});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
      child: SizedBox(
        height: 100,
        child: Card(
          elevation: 3,
          child: ListTile(
            leading: Image.network(session.image),
            title: Text(session.name),
            subtitle: Text(session.description),
          ),
        ),
      ),
    );
  }
}
