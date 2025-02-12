import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CustomCarouselSlider extends StatefulWidget {
  final List<String> images;
  const CustomCarouselSlider({super.key, required this.images});

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width, // 🔹 Take full screen width
          height: 200,
          child: CarouselSlider(
            items: widget.images.map((image) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(image,
                    fit: BoxFit.fill, width: double.infinity),
              );
            }).toList(),
            options: CarouselOptions(
              height: 200,
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 0.9,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.images.length,
            (index) => _buildIndicator(index),
          ),
        ),
      ],
    );
  }

  // 🔹 Custom Dot Indicator
  Widget _buildIndicator(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: currentIndex == index ? 12 : 8,
      height: 8,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: currentIndex == index ? Colors.blue : Colors.grey.shade400,
      ),
    );
  }
}
