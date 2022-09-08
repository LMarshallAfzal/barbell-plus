import 'package:flutter/material.dart';

class FunctionList extends StatelessWidget {
  const FunctionList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Expanded(
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) => const FunctionItem(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FunctionItem extends StatelessWidget {
  const FunctionItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/exercise');
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        height: 30,
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(3),
        ),
        child: Row(
          children: const [
            SizedBox(
                width: 50,
                height: 50,
                child: Icon(Icons.add_box_outlined, size: 20)),
            SizedBox(width: 30),
            Text('Some function or ability',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
