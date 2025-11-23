// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  slug: json['slug'] as String?,
  image: json['image'] as String?,
  creationAt:
      json['creationAt'] == null
          ? null
          : DateTime.parse(json['creationAt'] as String),
  updatedAt:
      json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'slug': instance.slug,
  'image': instance.image,
  'creationAt': instance.creationAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
};
