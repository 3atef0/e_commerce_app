import 'package:ecommerce_app/model/api_home.dart';

class CategoryDetailsModel {
  final bool status;
  final List<Products> products;

  CategoryDetailsModel({required this.status, required this.products});

  factory CategoryDetailsModel.fromJson(Map<String, dynamic> json) {
    return CategoryDetailsModel(
      status: json['status'],
      products: (json['data']['data'] as List)
          .map((e) => Products.fromJson(e))
          .toList(),
    );
  }
}
