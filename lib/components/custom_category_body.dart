import 'package:ecommerce_app/features/categorie_details_screen.dart';
import 'package:flutter/material.dart';

class CategoryCircle extends StatelessWidget {
  final dynamic img;
  final text;
  final int id;
  final String name;
  const CategoryCircle(
      {super.key,
      required this.img,
      this.text,
      required this.id,
      required this.name});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryDetailsScreen(
                      categoryId: id,
                      categoryName: name,
                    )));
      },
      child: Container(
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(img),
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
        ),
      ),
    );
  }
}
