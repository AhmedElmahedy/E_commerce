import 'package:e_commerc/data/model/CategoryOrBrandsResponseDto.dart';
import 'package:e_commerc/domain/entities/GetSubCategoriesResponseEntity.dart';

class GetSubCategoriesResponseDto extends GetSubCategoriesResponseEntity {
  GetSubCategoriesResponseDto({
      super.results,
      this.metadata,
      super.data,
  this.statusMsg,
  this.message});

  GetSubCategoriesResponseDto.fromJson(dynamic json) {
    results = json['results'];
    message = json['message'];
    statusMsg = json['statusMsg'];
    metadata = json['metadata'] != null ? MetadataDto.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(GetSubCategoriesDataDto.fromJson(v));
      });
    }
  }
  MetadataDto? metadata;
  String? statusMsg;
  String? message;

}

class GetSubCategoriesDataDto extends GetSubCategoriesDataEntity {
  GetSubCategoriesDataDto({
      super.id,
      super.name,
    super.slug,
    super.category,
    super.createdAt,
    super.updatedAt,});

  GetSubCategoriesDataDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }



}

