import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 65,
      child: Container(
        color: const Color.fromARGB(255, 209, 5, 5),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                borderSide: BorderSide.none,
              ),
              hintText: 'Search',
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
      ),
    );
  }
}
