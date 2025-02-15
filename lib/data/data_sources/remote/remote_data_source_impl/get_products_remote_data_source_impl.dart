import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerc/core/core/widget/hive_preference_util.dart';
import 'package:e_commerc/data/api_manager.dart';
import 'package:e_commerc/data/model/GetCartResponseDto.dart';
import 'package:e_commerc/domain/entities/AddProductsWishlistResponseEntity.dart';
import 'package:e_commerc/domain/entities/ProductResponseEntity.dart';
import 'package:e_commerc/domain/failures.dart';
import 'package:injectable/injectable.dart';

import '../../../end_point.dart';
import '../../../model/AddProductsWishlistResponseDto.dart';
import '../../../model/ProductResponseDto.dart';
import '../remote_data_source/get_products_remote_data_source.dart';
@Injectable(as: GetProductsRemoteDataSource)
class GetProductsRemoteDataSourceImpl  implements GetProductsRemoteDataSource{
  ApiManager apiManager;
  GetProductsRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<Either<Failures, ProductResponseDto>> getProductsFromCategory(String categoryId)async {
    // TODO: implement getProductsFromCategory
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult == ConnectivityResult.wifi ||
          checkResult == ConnectivityResult.mobile) {
        var response = await apiManager.getData(EndPoint.getAllProducts,
            queryParameters:{
              "category[in]" : categoryId
        } );
        var getAllProductsResponse = ProductResponseDto.fromJson(response.data);

        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(getAllProductsResponse);
        } else {
          return Left(
              ServerError(errorMessage: getAllProductsResponse.message!));
        }
      } else {
        // No internet
        return Left(NetworkError(
            errorMessage: 'No Internet Connection , Please Check Internet'));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, AddProductsWishlistResponseDto>> addWishlist(String productId)async {
    // TODO: implement addWishlist
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult == ConnectivityResult.wifi ||
          checkResult == ConnectivityResult.mobile) {
        var token = await HivePreferenceUtil.getData();
        var response = await apiManager.postData(EndPoint.wishlist,headers: {
          "token" : token
        },
            body:{
              "productId" : productId
            });
        var addWishlistResponse = AddProductsWishlistResponseDto.fromJson(response.data);

        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(addWishlistResponse);
        } else {
          return Left(
              ServerError(errorMessage:addWishlistResponse.message!));
        }
      } else {
        // No internet
        return Left(NetworkError(
            errorMessage: 'No Internet Connection , Please Check Internet'));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, ProductResponseDto>> getProductsWishlist() async{
    // TODO: implement getProductsWishlist
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult == ConnectivityResult.wifi ||
          checkResult == ConnectivityResult.mobile) {
        var token = await HivePreferenceUtil.getData();
        var response = await apiManager.getData(EndPoint.wishlist, headers: {
          "token" : token
        });
        var getWishlistResponse = ProductResponseDto.fromJson(response.data);

        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(getWishlistResponse);
        } else {
          return Left(
              ServerError(errorMessage:getWishlistResponse.message!));
        }
      } else {
        // No internet
        return Left(NetworkError(
            errorMessage: 'No Internet Connection , Please Check Internet'));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }
}