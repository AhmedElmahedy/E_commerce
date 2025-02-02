import 'package:e_commerc/domain/entities/CategoriesOrBrandsResponseEntity.dart';

class ProductResponseEntity {
  ProductResponseEntity(
      {this.results, this.metadata, this.data, this.message, this.statusMsg});

  num? results;
  ProductMetadataEntity? metadata;
  List<ProductDataEntity>? data;
  String? message;
  String? statusMsg;
}

class ProductDataEntity {
  ProductDataEntity({
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    this.id,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
    this.createdAt,
    this.updatedAt,
  });

  num? sold;
  List<String>? images;
  List<SubcategoryEntity>? subcategory;
  num? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  num? quantity;
  num? price;
  String? imageCover;
  CategoryOrBrandDataEntity? category;
  CategoryOrBrandDataEntity? brand;
  num? ratingsAverage;
  String? createdAt;
  String? updatedAt;
}

class SubcategoryEntity {
  SubcategoryEntity({
    this.id,
    this.name,
    this.slug,
    this.category,
  });

  String? id;
  String? name;
  String? slug;
  String? category;
}

class ProductMetadataEntity {
  ProductMetadataEntity({
    this.currentPage,
    this.numberOfPages,
    this.limit,
    this.nextPage,
  });

  num? currentPage;
  num? numberOfPages;
  num? limit;
  num? nextPage;
}
