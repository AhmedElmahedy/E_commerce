import 'package:e_commerc/domain/entities/CategoriesOrBrandsResponseEntity.dart';
import 'package:e_commerc/domain/entities/ProductResponseEntity.dart';

class GetCartResponseEntity {
  GetCartResponseEntity({
      this.status, 
      this.numOfCartItems, 
      this.cartId, 
      this.data,});

  String? status;
  num? numOfCartItems;
  String? cartId;
  GetDataCartEntity? data;



}

class GetDataCartEntity {
  GetDataCartEntity({
      this.id, 
      this.cartOwner, 
      this.products, 
      this.createdAt, 
      this.updatedAt, 
      this.v, 
      this.totalCartPrice,});

  String? id;
  String? cartOwner;
  List<GetProductsCartEntity>? products;
  String? createdAt;
  String? updatedAt;
  num? v;
  num? totalCartPrice;


}

class GetProductsCartEntity {
  GetProductsCartEntity({
      this.count, 
      this.id, 
      this.product, 
      this.price,});

  num? count;
  String? id;
  GetProductEntity? product;
  num? price;


}

class GetProductEntity {
  GetProductEntity({
      this.subcategory, 
      this.id, 
      this.title, 
      this.quantity, 
      this.imageCover, 
      this.category, 
      this.brand, 
      this.ratingsAverage, 
      });

  List<SubcategoryEntity>? subcategory;
  String? id;
  String? title;
  num? quantity;
  String? imageCover;
  CategoriesOrBrandsResponseEntity? category;
  CategoriesOrBrandsResponseEntity? brand;
  num? ratingsAverage;


}

