import 'package:ecommerce_app/components/custom_card.dart';
import 'package:flutter/material.dart';

class MegaSaleList extends StatelessWidget {
  const MegaSaleList({super.key});

  final List<Map<String, dynamic>> products = const [
    {
      'image': 'assets/1.png',
      'price': 299.43,
      'oldPrice': 534.33,
      'discount': '24% off',
    },
    {
      'image': 'assets/2.png',
      'price': 299.43,
      'oldPrice': 534.33,
      'discount': '24% off',
    },
    {
      'image': 'assets/3.png',
      'price': 299.43,
      'oldPrice': 534.33,
      'discount': '24% off',
    },
    {
      'image': 'assets/4.png',
      'price': 299.43,
      'oldPrice': 534.33,
      'discount': '24% off',
    },
    {
      'image': 'assets/5.png',
      'price': 299.43,
      'oldPrice': 534.33,
      'discount': '24% off',
    },
    {
      'image': 'assets/6.png',
      'price': 299.43,
      'oldPrice': 534.33,
      'discount': '24% off',
    },
    {
      'image': 'assets/7.png',
      'price': 299.43,
      'oldPrice': 534.33,
      'discount': '24% off',
    },
    {
      'image': 'assets/8.png',
      'price': 299.43,
      'oldPrice': 534.33,
      'discount': '24% off',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: CustomCard(
              image: products[index]['image'],
              price: products[index]['price'],
              oldPrice: products[index]['oldPrice'],
              discount: products[index]['discount'],
            ),
          );
        },
      ),
    );
  }
}
