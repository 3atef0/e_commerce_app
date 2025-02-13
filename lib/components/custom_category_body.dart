import 'package:flutter/material.dart';

class CategoryCircle extends StatelessWidget {
  final dynamic img;
  final text;
  const CategoryCircle({super.key, required this.img, this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(img),
          backgroundColor: Colors.yellow,
          radius: 50,
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          text,
          maxLines: 2,
          style: TextStyle(color: Colors.black),
        )
      ],
    );
  }
}
