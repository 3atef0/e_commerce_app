import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  final dynamic product;

  ProductDetailsScreen(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name ?? 'Product Details')),
      body: SingleChildScrollView(
        // جعل الصفحة قابلة للتمرير
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                  product.image ?? '',
                  fit: BoxFit.cover,
                  width: 300,
                  height: 300,
                ),
              ),
              SizedBox(height: 20),
              Text(
                product.name ?? 'No Name',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                '${product.price ?? 0} EGP',
                style: TextStyle(fontSize: 20, color: Colors.green),
              ),
              SizedBox(height: 20),
              Text(
                product.description ??
                    'No description available for this product',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
