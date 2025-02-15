import 'package:e_commerc/data/model/ProductResponseDto.dart';
import 'package:e_commerc/domain/entities/GetProductsWishlistResponseEntity.dart';

class GetProductsWishlistResponseDto extends GetProductsWishlistResponseEntity {
  GetProductsWishlistResponseDto({
      super.status,
      super.count,
      super.data,
    super.statusMsg,
    super.message
  });

  GetProductsWishlistResponseDto.fromJson(dynamic json) {
    status = json['status'];
    statusMsg = json['statusMsg'];
    message = json['message'];
    count = json['count'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(ProductDataDto.fromJson(v));
      });
    }
  }


}


