import 'package:ecommerce_app/constant/constant.dart';
import 'package:flutter/material.dart';

class CustomCategoryBody extends StatelessWidget {
  CustomCategoryBody({super.key});

  final DataIconCategories category = DataIconCategories();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: category.categories.length,
        itemBuilder: (context, index) {
          return _buildCategoryItem(
            category.categories[index]['image']!,
            category.categories[index]['label']!,
          );
        },
      ),
    );
  }

  Widget _buildCategoryItem(String imagePath, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8), // 🔹 Add spacing
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(45),
            child: Container(
              width: 85,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(45),
              ),
              child: Image.asset(imagePath),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }
}
