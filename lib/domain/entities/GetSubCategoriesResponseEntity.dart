class GetSubCategoriesResponseEntity {
  GetSubCategoriesResponseEntity({
    this.results,
    this.data,
  });

  num? results;
  List<GetSubCategoriesDataEntity>? data;
}

class GetSubCategoriesDataEntity {
  GetSubCategoriesDataEntity({
    this.id,
    this.name,
    this.slug,
    this.category,
    this.createdAt,
    this.updatedAt,
  });

  String? id;
  String? name;
  String? slug;
  String? category;
  String? createdAt;
  String? updatedAt;
}
