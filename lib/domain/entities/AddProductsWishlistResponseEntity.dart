class AddProductsWishlistResponseEntity {
  AddProductsWishlistResponseEntity(
      {this.status, this.message, this.data, this.statusMsg});

  String? status;
  String? message;
  List<String>? data;
  String? statusMsg;
}
