import 'package:flutter/material.dart';

class ProgressionPhoto {
  final AssetImage image;

  ProgressionPhoto({required this.image});
}

final List<ProgressionPhoto> progressionPhotos = [
  ProgressionPhoto(
    image: const AssetImage('assets/images/bodybuilder-1.jpg'),
  ),
  ProgressionPhoto(
    image: const AssetImage('assets/images/bodybuilder-2.jpg'),
  ),
  ProgressionPhoto(
    image: const AssetImage('assets/images/bodybuilder-3.jpg'),
  ),
  ProgressionPhoto(
    image: const AssetImage('assets/images/bodybuilder-4.jpg'),
  ),
  ProgressionPhoto(
    image: const AssetImage('assets/images/bodybuilder-5.jpg'),
  ),
  ProgressionPhoto(
    image: const AssetImage('assets/images/bodybuilder-6.jpg'),
  ),
];
