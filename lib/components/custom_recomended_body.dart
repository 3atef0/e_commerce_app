import 'package:flutter/material.dart';

import 'custom_card.dart';

class CustomRecomendedBody extends StatelessWidget {
  const CustomRecomendedBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          Image.asset('assets/image.png'),
          const SizedBox(height: 16),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomCard(
                  image: 'assets/1.png',
                  price: 299.43,
                  oldPrice: 534.33,
                  discount: '24% off'),
              CustomCard(
                  image: 'assets/2.png',
                  price: 299.43,
                  oldPrice: 534.33,
                  discount: '24% off')
            ],
          ),
          const SizedBox(height: 16),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomCard(
                  image: 'assets/3.png',
                  price: 299.43,
                  oldPrice: 534.33,
                  discount: '24% off'),
              CustomCard(
                  image: 'assets/4.png',
                  price: 299.43,
                  oldPrice: 534.33,
                  discount: '24% off')
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
