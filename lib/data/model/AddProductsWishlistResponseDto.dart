import 'package:e_commerc/domain/entities/AddProductsWishlistResponseEntity.dart';

class AddProductsWishlistResponseDto extends AddProductsWishlistResponseEntity {
  AddProductsWishlistResponseDto(
      {super.status, super.message, super.data, super.statusMsg});

  AddProductsWishlistResponseDto.fromJson(dynamic json) {
    status = json['status'];
    statusMsg = json['statusMsg'];
    message = json['message'];
    data = json['data'] != null ? json['data'].cast<String>() : [];
  }
}
