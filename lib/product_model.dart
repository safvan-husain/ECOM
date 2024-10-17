// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductModel {
  final String name;
  final String price;
  final String discount;
  final String rating;
  final String image;
  ProductModel({
    required this.name,
    required this.price,
    required this.discount,
    required this.rating,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'price': price,
      'discount': discount,
      'rating': rating,
      'image': image,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      name: map['name'] as String,
      price: map['price'] as String,
      discount: map['discount'] as String,
      rating: map['rating'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
