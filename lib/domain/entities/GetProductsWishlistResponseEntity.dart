import 'package:e_commerc/domain/entities/ProductResponseEntity.dart';

class GetProductsWishlistResponseEntity {
  GetProductsWishlistResponseEntity({
    this.status,
    this.statusMsg,
    this.message,
    this.count,
    this.data,
  });

  String? status;
  String? statusMsg;
  String? message;
  num? count;
  List<ProductDataEntity>? data;
}
