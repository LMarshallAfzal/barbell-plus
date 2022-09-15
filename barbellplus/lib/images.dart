import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

// upload all images in assets/images to firebase storage
// run this script with `dart images.dart`

Future<void> main() async {
  final storage = FirebaseStorage.instance;
  final ref = storage.ref();
  const String filePath = 'assets/images/';
  final images = [
    '${filePath}back.jpg',
    '${filePath}barbell-row.jpg',
    '${filePath}barbell-row.jpg',
    '${filePath}bench-press.jpg',
    '${filePath}bodybuilder-1.jpg',
    '${filePath}bodybuilder-2.jpg',
    '${filePath}bodybuilder-3.jpg',
    '${filePath}bodybuilder-4.jpg',
    '${filePath}bodybuilder-5.jpg',
    '${filePath}bodybuilder-6.jpg',
    '${filePath}chin-up.jpg',
    '${filePath}deadlift.jpg',
    '${filePath}dips.jpg',
    '${filePath}dumbell-rack.jpg',
    '${filePath}greyscale-lifter.jpg',
    '${filePath}greyscale-pullup.jpg',
    '${filePath}lifter.jpg',
    '${filePath}login-background.jpg',
    '${filePath}overhead-press.jpg',
    '${filePath}portfolio-cover.jpg',
    '${filePath}powerlifter-squat.jpg',
    '${filePath}preacher-curl.jpg',
    '${filePath}profile.jpg',
    '${filePath}sixpack.jpg',
    '${filePath}squat.jpg',
    '${filePath}squat.jpg',
  ];

  for (final image in images) {
    final file = File(image);
    final bytes = await file.readAsBytes();
    final name = image.split('/').last;
    final upload = ref.child('images/$name').putData(bytes);
    final snapshot = await upload;
    final url = await snapshot.ref.getDownloadURL();
  }
}
