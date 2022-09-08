import 'package:barbellplus/models/progression_photo.dart';
import 'package:flutter/material.dart';

class ImageGallery extends StatelessWidget {
  const ImageGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 80,
      child: Row(children: [
        SizedBox(
          height: 80,
          width: 60,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add_photo_alternate_outlined,
              color: Colors.red,
              size: 60,
            ),
          ),
        ),
        const SizedBox(width: 20),
        SizedBox(
          width: 300,
          height: 60,
          child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              scrollDirection: Axis.horizontal,
              itemCount: progressionPhotos.length,
              itemBuilder: (context, index) {
                return Photo(
                  photo: progressionPhotos[index],
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 10)),
        )
      ]),
    );
  }
}

class Photo extends StatelessWidget {
  final ProgressionPhoto photo;
  const Photo({
    Key? key,
    required this.photo,
  }) : super(key: key);

  get image => null;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: photo.image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
