import 'package:json_annotation/json_annotation.dart';

import 'category.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  int? id;
  String? title;
  String? slug;
  int? price;
  String? description;
  Category? category;
  List<String>? images;
  DateTime? creationAt;
  DateTime? updatedAt;

  Product({
    this.id,
    this.title,
    this.slug,
    this.price,
    this.description,
    this.category,
    this.images,
    this.creationAt,
    this.updatedAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return _$ProductFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
