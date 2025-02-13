class CategoriesModel2 {
  final bool status;
  final List<CategoryModel> categories;

  CategoriesModel2({required this.status, required this.categories});

  factory CategoriesModel2.fromJson(Map<String, dynamic> json) {
    return CategoriesModel2(
      status: json['status'],
      categories: (json['data']['data'] as List)
          .map((e) => CategoryModel.fromJson(e))
          .toList(),
    );
  }
}

class CategoryModel {
  final int id;
  final String name;
  final String image;

  CategoryModel({required this.id, required this.name, required this.image});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }
}
