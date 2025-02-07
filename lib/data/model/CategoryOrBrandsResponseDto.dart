import 'package:e_commerc/domain/entities/CategoryOrBrandResponseEntity.dart';

class CategoriesOrBrandsResponseDto extends CategoryOrBrandResponseEntity {
  CategoriesOrBrandsResponseDto(
      {super.results,
      super.metadata,
      super.data,
      this.message,
      this.statusMsg});

  CategoriesOrBrandsResponseDto.fromJson(dynamic json) {
    results = json['results'];
    statusMsg = json['statusMsg'];
    message = json['message'];
    metadata = json['metadata'] != null
        ? MetadataDto.fromJson(json['metadata'])
        : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(CategoryOrBrandDataDto.fromJson(v));
      });
    }
  }

  String? statusMsg;
  String? message;
}

class CategoryOrBrandDataDto extends CategoryOrBrandDataEntity {
  CategoryOrBrandDataDto({
    super.id,
    super.name,
    super.slug,
    super.image,
    this.createdAt,
    this.updatedAt,
  });

  CategoryOrBrandDataDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  String? createdAt;
  String? updatedAt;
}

class MetadataDto extends MetadataEntity {
  MetadataDto({
    super.currentPage,
    super.numberOfPages,
    super.limit,
  });

  MetadataDto.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
  }
}
