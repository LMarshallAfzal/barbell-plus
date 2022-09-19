//Stateless widget for the exercise dialog which shows an image and information about the exercise

import 'package:barbellplus/services/models.dart';
import 'package:flutter/material.dart';

class ExerciseDialog extends StatelessWidget {
  final Exercise exercise;

  const ExerciseDialog({Key? key, required this.exercise}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Stack(
        children: <Widget>[
          ExerciseDialogContent(
            exercise: exercise,
          ),
        ],
      ),
    );
  }
}

class ExerciseDialogContent extends StatelessWidget {
  final Exercise exercise;

  const ExerciseDialogContent({Key? key, required this.exercise})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(
            top: 230,
            bottom: 25,
            left: 16,
            right: 16,
          ),
          margin: const EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(17),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                exercise.name,
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'description',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(height: 24.0),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Close',
                      style: TextStyle(
                        color: Color.fromARGB(255, 209, 5, 5),
                        fontWeight: FontWeight.w700,
                      )),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 30,
          left: 16,
          right: 16,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: const Image(
                image: AssetImage('assets/images/image-unavailable.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          top: 30,
          left: 16,
          right: 16,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image(
                image: NetworkImage(exercise.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
