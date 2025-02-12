import 'dart:core';

class HomeModel {
  bool? status;
  dynamic message;
  Data? data;

  HomeModel({this.status, this.message, this.data});

  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] ?? '';
    message = json['message'] ?? '';
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  List<Banners>? banners;
  List<Products>? products;

  Data({
    this.banners,
    this.products,
  });

  Data.fromJson(Map<String, dynamic> json) {
    if (json['banners'] != null) {
      banners = [];
      json['banners'].forEach((v) {
        banners!.add(Banners.fromJson(v));
      });
    }
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
  }
}

class Banners {
  int? id;
  String? image;
  dynamic category;
  dynamic product;

  Banners({this.id, this.image, this.category, this.product});

  Banners.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    image = json['image'] ?? '';
    category = json['category'] ?? '';
    product = json['product'] ?? '';
  }
}

class Products {
  int? id;
  double? price;
  double? oldPrice;
  int? discount;
  String? image;
  String? name;
  String? description;
  List<String>? images;
  bool? inFavorites;
  bool? inCart;

  Products({
    this.id,
    this.price,
    this.oldPrice,
    this.discount,
    this.image,
    this.name,
    this.description,
    this.images,
    this.inFavorites,
    this.inCart,
  });

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    price = (json['price'] as num?)?.toDouble();
    oldPrice = (json['old_price'] as num?)?.toDouble();
    discount = json['discount'] ?? '';
    image = json['image'] ?? '';
    name = json['name'] ?? '';
    description = json['description'] ?? '';
    images = json['images'] != null ? List<String>.from(json['images']) : [];
    inFavorites = json['in_favorites'] ?? '';
    inCart = json['in_cart'] ?? '';
  }
}
