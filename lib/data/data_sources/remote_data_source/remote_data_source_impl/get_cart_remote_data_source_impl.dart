import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerc/data/api_manager.dart';
import 'package:e_commerc/data/data_sources/remote_data_source/get_cart_remote_data_source.dart';
import 'package:e_commerc/domain/entities/GetCartResponseEntity.dart';
import 'package:e_commerc/domain/failures.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/core/widget/hive_preference_util.dart';
import '../../../end_point.dart';
import '../../../model/GetCartResponseDto.dart';

@Injectable(as: GetCartRemoteDataSource)
class GetCartRemoteDataSourceImpl implements GetCartRemoteDataSource {
  ApiManager apiManager;

  GetCartRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, GetCartResponseDto>> getCart() async {
    // TODO: implement getCart
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult == ConnectivityResult.wifi ||
          checkResult == ConnectivityResult.mobile) {
        var token = await HivePreferenceUtil.getData(key: 'token');
        if (token == null) {
          return left((Failures(errorMessage: "User is not authenticated")));
        }
        // print("Token : $token");
        var response = await apiManager
            .getData(EndPoint.getCart, headers: {'token': token});
        var getCartResponse = GetCartResponseDto.fromJson(response.data);

        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(getCartResponse);
        } else {
          return Left(ServerError(errorMessage: getCartResponse.message!));
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
  Future<Either<Failures, GetCartResponseDto>> deleteItemInCart(String productId) async{
    // TODO: implement deleteItemInCart
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult == ConnectivityResult.wifi ||
          checkResult == ConnectivityResult.mobile) {
        var token = await HivePreferenceUtil.getData(key: 'token');
        if (token == null) {
          return left((Failures(errorMessage: "User is not authenticated")));
        }
        // print("Token : $token");
        var response = await apiManager
            .deleteData('${EndPoint.deleteCart}/$productId', headers: {'token': token});
        var deleteItemInCartResponse = GetCartResponseDto.fromJson(response.data);

        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(deleteItemInCartResponse);
        } else {
          return Left(ServerError(errorMessage: deleteItemInCartResponse.message!));
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
  Future<Either<Failures, GetCartResponseDto>> updateCountItemInCart(String productId, int count)async {
    // TODO: implement updateCountItemInCart
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult == ConnectivityResult.wifi ||
          checkResult == ConnectivityResult.mobile) {
        var token = await HivePreferenceUtil.getData(key: 'token');
        if (token == null) {
          return left((Failures(errorMessage: "User is not authenticated")));
        }
        // print("Token : $token");
        var response = await apiManager
            .updateData('${EndPoint.deleteCart}/$productId',
            body: {
              "count" : "$count"
            },
            headers: {'token': token});
        var updateCountInCartResponse = GetCartResponseDto.fromJson(response.data);

        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(updateCountInCartResponse);
        } else {
          return Left(ServerError(errorMessage: updateCountInCartResponse.message!));
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
